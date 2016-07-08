if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install HMMer3
if ! test -e .hmmer; then
wget -c http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-cygwin64.tar.gz || exit $?
tar -xzf hmmer-3.1b2-cygwin64.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || exit $?
cp -R hmmer-3.1b2-cygwin64/binaries/* $PREFIX/share/claident/bin/ || exit $?
rm -rf hmmer-3.1b2-cygwin64.tar.gz hmmer-3.1b2-cygwin64 || exit $?
echo 'HMMer was installed correctly!'
touch .hmmer || exit $?
fi
# download and install MAFFT7
if ! test -e .mafft; then
wget -c http://mafft.cbrc.jp/alignment/software/mafft-7.299-mingw64.tar || exit $?
tar -xf mafft-7.299-mingw64.tar || exit $?
mkdir -p $PREFIX/share/claident/bin || exit $?
rm -rf $PREFIX/share/claident/bin/mafftdir || exit $?
mv usr/local/libexec/mafft $PREFIX/share/claident/bin/mafftdir || exit $?
perl -i -npe 's/\/usr\/local\/libexec\/mafft/$ENV{"PREFIX"}\/share\/claident\/bin\/mafftdir/;s/prefix="\$MAFFT_BINARIES"/prefix=$ENV{"PREFIX"}\/share\/claident\/bin\/mafftdir/' usr/local/bin/mafft || exit $?
mv usr/local/bin/mafft $PREFIX/share/claident/bin/ || exit $?
rm -rf mafft-7.299-mingw64.tar usr || exit $?
echo 'MAFFT was installed correctly!'
touch .mafft || exit $?
fi
# download and install Metaxa
if ! test -e .metaxa; then
wget -c http://microbiology.se/sw/Metaxa2_2.1.3.tar.gz || exit $?
tar -xzf Metaxa2_2.1.3.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || exit $?
cp -R Metaxa2_2.1.3/metaxa2 Metaxa2_2.1.3/metaxa2_* $PREFIX/share/claident/bin/ || exit $?
rm -rf Metaxa2_2.1.3.tar.gz Metaxa2_2.1.3 || exit $?
echo '#!/bin/sh' > metaxa2 || exit $?
echo "export PATH=$PREFIX/share/claident/bin:\$PATH" >> metaxa2 || exit $?
echo "perl $PREFIX/share/claident/bin/metaxa2 \$*" >> metaxa2 || exit $?
chmod 755 metaxa2 || exit $?
mv metaxa2 $PREFIX/bin/ || exit $?
echo 'Metaxa was installed correctly!'
touch .metaxa || exit $?
fi
# download and install ITSx
if ! test -e .itsx; then
wget -c http://microbiology.se/sw/ITSx_1.0.11.tar.gz || exit $?
tar -xzf ITSx_1.0.11.tar.gz || exit $?
mkdir -p $PREFIX/share/claident/bin || exit $?
rm -rf $PREFIX/share/claident/bin/ITSx_db || exit $?
mv ITSx_1.0.11/ITSx ITSx_1.0.11/ITSx_db $PREFIX/share/claident/bin/ || exit $?
rm -rf ITSx_1.0.11.tar.gz ITSx_1.0.11 || exit $?
echo '#!/bin/sh' > ITSx || exit $?
echo "export PATH=$PREFIX/share/claident/bin:\$PATH" >> ITSx || exit $?
echo "perl $PREFIX/share/claident/bin/ITSx \$*" >> ITSx || exit $?
chmod 755 ITSx || exit $?
mv ITSx $PREFIX/bin/ || exit $?
echo 'ITSx was installed correctly!'
touch .itsx || exit $?
fi
echo 'You do not need to care about error messages.'
