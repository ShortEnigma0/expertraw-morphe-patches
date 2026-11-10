/*
 * SPDX-License-Identifier: GPL-3.0-only
 * Copyright (C) 2026 ShortEnigma0
 * Expert RAW extension for Morphe. See LICENSE and NOTICE in the repository root.
 */
package app.morphe.extension.expertraw;

import android.content.Context;
import android.util.AttributeSet;
import com.samsung.android.app.galaxyraw.setting.CameraSwitchPreference;

/**
 * Settings switch that persists itself to PpBypass prefs and ignores the settings fragment's
 * listeners (the fragment vetoes / redirects preference keys it doesn't know).
 */
@SuppressWarnings("unused")
public class PpBypassPreference extends CameraSwitchPreference {
    public PpBypassPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override
    public void onAttached() {
        super.onAttached();
        super.setChecked(PpBypass.isEnabled(getContext()));
    }

    @Override
    public void setChecked(boolean checked) {
        super.setChecked(checked);
        PpBypass.set(getContext(), checked);
    }

    @Override
    public boolean callChangeListener(Object newValue) {
        if (newValue instanceof Boolean) PpBypass.set(getContext(), (Boolean) newValue);
        return true;
    }

    @Override
    public void setOnPreferenceClickListener(OnPreferenceClickListener listener) {
    }

    @Override
    public void setOnPreferenceChangeListener(OnPreferenceChangeListener listener) {
    }
}
