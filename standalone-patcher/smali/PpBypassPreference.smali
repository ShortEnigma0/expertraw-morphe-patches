# SPDX-License-Identifier: GPL-3.0-only
# Copyright (C) 2026 ShortEnigma0
# Part of expertraw-morphe-patches standalone patcher. See LICENSE in the repository root.
.class public Lcom/samsung/android/app/galaxyraw/mod/PpBypassPreference;
.super Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;
.source "PpBypassPreference.java"

# Mod: switch that persists itself to PpBypass prefs and ignores the
# settings fragment's listeners (which veto/redirect keys they don't know).

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    invoke-direct {p0, p1, p2}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    return-void
.end method

.method public onAttached()V
    .locals 1
    invoke-super {p0}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->onAttached()V
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->isEnabled(Landroid/content/Context;)Z
    move-result v0
    invoke-super {p0, v0}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->setChecked(Z)V
    return-void
.end method

.method public setChecked(Z)V
    .locals 1
    invoke-super {p0, p1}, Lcom/samsung/android/app/galaxyraw/setting/CameraSwitchPreference;->setChecked(Z)V
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0, p1}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->set(Landroid/content/Context;Z)V
    return-void
.end method

.method public callChangeListener(Ljava/lang/Object;)Z
    .locals 1
    instance-of v0, p1, Ljava/lang/Boolean;
    if-eqz v0, :cond_done
    check-cast p1, Ljava/lang/Boolean;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z
    move-result p1
    invoke-virtual {p0}, Landroidx/preference/Preference;->getContext()Landroid/content/Context;
    move-result-object v0
    invoke-static {v0, p1}, Lcom/samsung/android/app/galaxyraw/mod/PpBypass;->set(Landroid/content/Context;Z)V
    :cond_done
    const/4 v0, 0x1
    return v0
.end method

.method public setOnPreferenceClickListener(Landroidx/preference/Preference$OnPreferenceClickListener;)V
    .locals 0
    return-void
.end method

.method public setOnPreferenceChangeListener(Landroidx/preference/Preference$OnPreferenceChangeListener;)V
    .locals 0
    return-void
.end method
