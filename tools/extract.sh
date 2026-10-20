#!/usr/bin/env bash
# Rebuild extracted/ and decompiled/ from the Roland downloads in vendor/archives/.
# Needs: unzip, JPEXS FFDec flatpak (com.jpexs.decompiler.flash).
set -euo pipefail
cd "$(dirname "$0")/.."

unzip -o -q vendor/archives/bts_katana_w400.zip -d /tmp/bts_zip
mkdir -p vendor/tone_studio_v4.0.0
cp -n /tmp/bts_zip/bts_katana_w400/* vendor/tone_studio_v4.0.0/ || true

# The installer .exe is a self-extracting zip holding the Adobe AIR app.
# unzip exits 1 on the exe's self-extractor stub ("extra bytes at beginning"); that's expected.
rm -rf extracted/tone_studio_air_app && mkdir -p extracted
unzip -o -q vendor/tone_studio_v4.0.0/BOSS_TONE_STUDIO_for_KATANA.exe -d /tmp/bts_air || [ $? -eq 1 ]
mv "/tmp/bts_air/BOSS TONE STUDIO for KATANA" extracted/tone_studio_air_app
rm -rf /tmp/bts_zip /tmp/bts_air

APP=extracted/tone_studio_air_app
ANE="$APP/META-INF/AIR/extensions/com.roland.rwc/META-INF/ANE/Windows-x86/library.swf"
mkdir -p decompiled/logs
flatpak run com.jpexs.decompiler.flash -export script "$PWD/decompiled/tone_studio_as3" "$PWD/$APP/BOSS_TONE_STUDIO_for_KATANA.swf" > decompiled/logs/export_app.log 2>&1
flatpak run com.jpexs.decompiler.flash -export script "$PWD/decompiled/rwc_ane_as3" "$PWD/$ANE" > decompiled/logs/export_rwc.log 2>&1
echo "done: $(find decompiled -name '*.as' | wc -l) scripts"
