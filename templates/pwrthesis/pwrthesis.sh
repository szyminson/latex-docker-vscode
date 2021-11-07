cd /tmp
wget http://tomasz.kubik.staff.iiar.pwr.wroc.pl/DyplomInzSzablonWinMemoir-v06.zip
unzip DyplomInzSzablonWinMemoir*

sudo $TEX_BIN/tlmgr install fontaxes ebgaramond tex-gyre xpatch layouts printlen enumitem datetime fmtcount gustlib

cp -r DyplomInzSzablonWinMemoir/* $LATEX_PROJECT_PATH
rm -rf DyplomInzSzablonWinMemoir*

(echo "% !TeX root = Dyplom.tex"; cat $LATEX_PROJECT_PATH/Dyplom.tex) > Dyplom.tmp && \
mv -f Dyplom.tmp $LATEX_PROJECT_PATH/Dyplom.tex
