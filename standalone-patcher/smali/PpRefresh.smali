# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
.class public final Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;
.super Ljava/lang/Object;
.source "PpRefresh.java"


# static fields
.field private static volatile sCtx:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 15
    new-instance v0, Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static attach(Ljava/lang/Object;)V
    .registers 2

    .line 21
    instance-of v0, p0, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    if-eqz v0, :cond_d

    new-instance v0, Ljava/lang/ref/WeakReference;

    check-cast p0, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    .line 22
    :cond_d
    return-void
.end method

.method static synthetic lambda$onScanned$0(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V
    .registers 4

    .line 33
    const-string v0, "GrawMod"

    :try_start_2
    invoke-interface {p0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->updateLatestMedia()V

    .line 34
    invoke-interface {p0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->updateThumbnail()V

    .line 35
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thumbnail refreshed after scan: "

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1e
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_1e} :catch_1f

    .line 38
    goto :goto_3a

    .line 36
    :catch_1f
    move-exception p0

    .line 37
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thumbnail refresh failed: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    :goto_3a
    return-void
.end method

.method public static onScanned(Ljava/lang/String;Landroid/net/Uri;)V
    .registers 6

    .line 26
    sget-object v0, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh;->sCtx:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;

    .line 27
    if-eqz v0, :cond_3d

    if-nez p1, :cond_d

    goto :goto_3d

    .line 29
    :cond_d
    :try_start_d
    invoke-interface {v0}, Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;->getBackgroundHandler()Landroid/os/Handler;

    move-result-object p1

    .line 30
    if-nez p1, :cond_14

    return-void

    .line 31
    :cond_14
    new-instance v1, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;

    invoke-direct {v1, v0, p0}, Lcom/samsung/android/app/galaxyraw/mod/PpRefresh$0;-><init>(Lcom/samsung/android/app/galaxyraw/interfaces/CameraContext;Ljava/lang/String;)V

    const-wide/16 v2, 0x12c

    invoke-virtual {p1, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1e
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_1e} :catch_1f

    .line 42
    goto :goto_3c

    .line 40
    :catch_1f
    move-exception p0

    .line 41
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "thumbnail refresh not scheduled: "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string p1, "GrawMod"

    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    :goto_3c
    return-void

    .line 27
    :cond_3d
    :goto_3d
    return-void
.end method
