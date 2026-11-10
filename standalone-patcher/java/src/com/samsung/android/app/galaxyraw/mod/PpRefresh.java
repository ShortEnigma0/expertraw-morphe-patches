/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
 */
package com.samsung.android.app.galaxyraw.mod;

import android.net.Uri;
import android.os.Handler;
import android.util.Log;
import com.samsung.android.app.galaxyraw.interfaces.CameraContext;
import java.lang.ref.WeakReference;

/**
 * MOD: Stock Expert RAW refreshes the latest-photo thumbnail from Samsung's secmedia draft row,
 * which a re-signed build cannot create. Instead, refresh once MediaScanner has indexed the saved
 * file (same calls as CameraGenericEventHandler.onPostPictureProcessingCompleted).
 */
public final class PpRefresh {
    private static volatile WeakReference<CameraContext> sCtx = new WeakReference<>(null);

    private PpRefresh() {}

    /** Called from GalaxyRaw.onResume. */
    public static void attach(Object activity) {
        if (activity instanceof CameraContext) sCtx = new WeakReference<>((CameraContext) activity);
    }

    /** Called from PostProcessDBHelper's MediaScanner completion callback. */
    public static void onScanned(String path, Uri uri) {
        final CameraContext c = sCtx.get();
        if (c == null || uri == null) return;
        try {
            Handler h = c.getBackgroundHandler();
            if (h == null) return;
            h.postDelayed(() -> {
                try {
                    c.updateLatestMedia();
                    c.updateThumbnail();
                    Log.i("GrawMod", "thumbnail refreshed after scan: " + path);
                } catch (RuntimeException e) {
                    Log.w("GrawMod", "thumbnail refresh failed: " + e);
                }
            }, 300L);
        } catch (RuntimeException e) {
            Log.w("GrawMod", "thumbnail refresh not scheduled: " + e);
        }
    }
}
