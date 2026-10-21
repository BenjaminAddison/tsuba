#!/bin/sh
# Rebuild app/fonts/ from Google Fonts' Archivo[wdth,wght].ttf and IBMPlexMono-Regular.ttf (both OFL).
# egui can't use variable-font axes, so this cuts the fixed instances DESIGN.md names, subset to Latin + the symbols
# the UI draws. Needs fonttools (python3 -m pip install fonttools).
#   tools/build_fonts.sh <dir with Archivo[wdth,wght].ttf or Archivo.ttf, IBMPlexMono-Regular.ttf>
set -e
src=$1
out=$(dirname "$0")/../app/fonts
archivo=$(ls "$src"/Archivo*.ttf | grep -v Italic | head -1)
chars="U+0020-007E,U+00A0-00FF,U+2010-2027,U+2122,U+2190-2193,U+2212,U+25B2-25BC,U+25C0,U+25B6"
cut() { # name wght wdth
    python3 -I -m fontTools.varLib.instancer -q "$archivo" wght="$2" wdth="$3" -o "$out/tmp.ttf"
    python3 -I -m fontTools.subset "$out/tmp.ttf" --unicodes="$chars" --layout-features='kern' --output-file="$out/$1.ttf"
    rm "$out/tmp.ttf"
}
cut Archivo-ExtraBold 800 100
cut Archivo-SemiExpanded-ExtraBold 800 112.5
cut Archivo-Expanded-ExtraBold 800 125
cut Archivo-SemiExpanded-Bold 700 112.5
cut Archivo-Expanded-Bold 700 125
cp "$src/IBMPlexMono-Regular.ttf" "$out/"  # unmodified: "Plex" is a Reserved Font Name, so no subsetting
