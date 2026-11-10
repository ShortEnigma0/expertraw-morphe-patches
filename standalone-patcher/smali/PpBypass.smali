# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
.class public final Lcom/samsung/android/app/galaxyraw/mod/PpBypass;
.super Ljava/lang/Object;
.source "PpBypass.java"

# Mod: "Disable post-processing" toggle storage + query.

.field public static final KEY:Ljava/lang/String; = "disable_post_processing"
.field public static final PREFS:Ljava/lang/String; = "graw_mod_prefs"
.field public static final TAG:Ljava/lang/String; = "GrawMod"

.method public constructor <init>()V
    .locals 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V
    return-void
.end method

.method public static isEnabled(Landroid/content/Context;)Z
    .locals 3
    const/4 v0, 0x0
    if-nez p0, :cond_ctx
    return v0
    :cond_ctx
    :try_start
    const-string v1, "graw_mod_prefs"
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v1
    const-string v2, "disable_post_processing"
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all
    return v0
    :catch_all
    const/4 v0, 0x0
    return v0
.end method

.method public static set(Landroid/content/Context;Z)V
    .locals 3
    if-nez p0, :cond_ctx
    return-void
    :cond_ctx
    const-string v0, "graw_mod_prefs"
    const/4 v1, 0x0
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    const-string v1, "disable_post_processing"
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;
    move-result-object v0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    const-string v0, "GrawMod"
    new-instance v1, Ljava/lang/StringBuilder;
    const-string v2, "disable_post_processing set to "
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v1
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    return-void
.end method

# Called from capture makers; logs and returns whether to force a single-frame capture.
.method public static forceSingleFrame(Landroid/content/Context;)Z
    .locals 2
    invoke-static {p0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z
    move-result v0
    if-eqz v0, :cond_off
    const-string v0, "GrawMod"
    const-string v1, "post-processing bypass ON: forcing single-frame capture (no multi-frame merge)"
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    const/4 v0, 0x1
    return v0
    :cond_off
    const/4 v0, 0x0
    return v0
.end method

# MOD: getCameraCutoutSetting needs MANAGE_ACTIVITY_TASKS (signature); default 0 when denied.
.method public static safeCutout(Landroid/app/SemActivityTaskManager;ILjava/lang/String;)I
    .locals 2
    :try_start
    invoke-virtual {p0, p1, p2}, Landroid/app/SemActivityTaskManager;->getCameraCutoutSetting(ILjava/lang/String;)I
    move-result v0
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all
    return v0
    :catch_all
    move-exception v0
    const-string v1, "GrawMod"
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    const/4 v0, 0x0
    return v0
.end method
