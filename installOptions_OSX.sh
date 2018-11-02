if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, and install sff_extract
if ! test -e .sffextract; then
PYTHON=`which python` || exit $?
wget -c http://bioinf.comav.upv.es/downloads/sff_extract_0_3_0 || exit $?
echo '#!'$PYTHON > sff_extract || exit $?
cat sff_extract_0_3_0 >> sff_extract || exit $?
chmod 755 sff_extract || exit $?
mkdir -p $PREFIX/bin || sudo mkdir -p $PREFIX/bin || exit $?
mv sff_extract $PREFIX/bin/ || sudo mv sff_extract $PREFIX/bin/ || exit $?
rm sff_extract_0_3_0 || exit $?
echo 'sff_extract was installed correctly!'
touch .sffextract || exit $?
fi
# download and install HMMer
if ! test -e .hmmer; then
wget -c http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-macosx-intel.tar.gz || exit $?
tar -xzf hmmer-3.1b2-macosx-intel.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv hmmer-3.1b2-macosx-intel/binaries/* $PREFIX/share/claident/bin/ || sudo mv hmmer-3.1b2-macosx-intel/binaries/* $PREFIX/share/claident/bin/ || exit $?
rm -rf hmmer-3.1b2-macosx-intel.tar.gz hmmer-3.1b2-macosx-intel || exit $?
echo 'HMMer was installed correctly!'
touch .hmmer || exit $?
fi
# download and install MAFFT
if ! test -e .mafft; then
wget -c http://mafft.cbrc.jp/alignment/software/mafft-7.407-mac.zip || exit $?
unzip -qq mafft-7.407-mac.zip || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
mv mafft-mac/mafft.bat $PREFIX/share/claident/bin/mafft || sudo mv mafft-mac/mafft.bat $PREFIX/share/claident/bin/mafft || exit $?
rm -rf $PREFIX/share/claident/bin/mafftdir || sudo rm -rf $PREFIX/share/claident/bin/mafftdir || exit $?
mv mafft-mac/mafftdir $PREFIX/share/claident/bin/ || sudo mv mafft-mac/mafftdir $PREFIX/share/claident/bin/ || exit $?
rm -rf mafft-7.407-mac.zip mafft-mac || exit $?
echo 'MAFFT was installed correctly!'
touch .mafft || exit $?
fi
# download and install Metaxa
if ! test -e .metaxa; then
wget -c http://microbiology.se/sw/Metaxa2_2.2.tar.gz || exit $?
tar -xzf Metaxa2_2.2.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
rm -rf $PREFIX/share/claident/bin/metaxa2_db || sudo rm -rf $PREFIX/share/claident/bin/metaxa2_db || exit $?
mv Metaxa2_2.2/metaxa2 Metaxa2_2.2/metaxa2_* $PREFIX/share/claident/bin/ || sudo mv Metaxa2_2.2/metaxa2 Metaxa2_2.2/metaxa2_* $PREFIX/share/claident/bin/ || exit $?
rm -rf Metaxa2_2.2.tar.gz Metaxa2_2.2 || exit $?
echo '#!/bin/sh' > metaxa2 || exit $?
echo "export PATH=$PREFIX/share/claident/bin:\$PATH" >> metaxa2 || exit $?
echo "perl $PREFIX/share/claident/bin/metaxa2 \$*" >> metaxa2 || exit $?
chmod 755 metaxa2 || exit $?
mv metaxa2 $PREFIX/bin/ || sudo mv metaxa2 $PREFIX/bin/ || exit $?
echo 'Metaxa was installed correctly!'
touch .metaxa || exit $?
fi
# download and install ITSx
if ! test -e .itsx; then
wget -c http://microbiology.se/sw/ITSx_1.0.11.tar.gz || exit $?
tar -xzf ITSx_1.0.11.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || sudo mkdir -p $PREFIX/share/claident/bin || exit $?
rm -rf $PREFIX/share/claident/bin/ITSx_db || sudo rm -rf $PREFIX/share/claident/bin/ITSx_db || exit $?
mv ITSx_1.0.11/ITSx ITSx_1.0.11/ITSx_db $PREFIX/share/claident/bin/ || sudo mv ITSx_1.0.11/ITSx ITSx_1.0.11/ITSx_db $PREFIX/share/claident/bin/ || exit $?
rm -rf ITSx_1.0.11.tar.gz ITSx_1.0.11 || exit $?
echo '#!/bin/sh' > ITSx || exit $?
echo "export PATH=$PREFIX/share/claident/bin:\$PATH" >> ITSx || exit $?
echo "perl $PREFIX/share/claident/bin/ITSx \$*" >> ITSx || exit $?
chmod 755 ITSx || exit $?
mv ITSx $PREFIX/bin/ || sudo mv ITSx $PREFIX/bin/ || exit $?
echo 'ITSx was installed correctly!'
touch .itsx || exit $?
fi
echo 'You do not need to care about error messages.'
