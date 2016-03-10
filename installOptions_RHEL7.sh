if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download and install HMMer
if ! test -e .hmmer; then
wget -c http://eddylab.org/software/hmmer3/3.1b2/hmmer-3.1b2-linux-intel-x86_64.tar.gz || exit $?
tar -xzf hmmer-3.1b2-linux-intel-x86_64.tar.gz || exit $?
mv hmmer-3.1b2-linux-intel-x86_64/binaries/* $PREFIX/share/claident/bin/ || sudo mv hmmer-3.1b2-linux-intel-x86_64/binaries/* $PREFIX/share/claident/bin/ || exit $?
rm -rf hmmer-3.1b2-linux-intel-x86_64.tar.gz hmmer-3.1b2-linux-intel-x86_64 || exit $?
echo 'HMMer was installed correctly!'
touch .hmmer || exit $?
fi
# download and install MAFFT
if ! test -e .mafft; then
wget -c http://mafft.cbrc.jp/alignment/software/mafft-7.273-linux.tgz || exit $?
tar -xzf mafft-7.273-linux.tgz || exit $?
mv mafft-linux64/mafft.bat $PREFIX/share/claident/bin/mafft || sudo mv mafft-linux64/mafft.bat $PREFIX/share/claident/bin/mafft || exit $?
rm -rf $PREFIX/share/claident/bin/mafftdir || sudo rm -rf $PREFIX/share/claident/bin/mafftdir || exit $?
mv mafft-linux64/mafftdir $PREFIX/share/claident/bin/ || sudo mv mafft-linux64/mafftdir $PREFIX/share/claident/bin/ || exit $?
rm -rf mafft-7.273-linux.tgz mafft-linux64 mafft-linux32 || exit $?
echo 'MAFFT was installed correctly!'
touch .mafft || exit $?
fi
# download and install Metaxa
if ! test -e .metaxa; then
wget -c http://microbiology.se/sw/Metaxa2_2.1.2.tar.gz || exit $?
tar -xzf Metaxa2_2.1.2.tar.gz || exit $?
mv Metaxa2_2.1.2/metaxa2 Metaxa2_2.1.2/metaxa2_* $PREFIX/share/claident/bin/ || sudo mv Metaxa2_2.1.2/metaxa2 Metaxa2_2.1.2/metaxa2_* $PREFIX/share/claident/bin/ || exit $?
rm -rf Metaxa2_2.1.2.tar.gz Metaxa2_2.1.2 || exit $?
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
