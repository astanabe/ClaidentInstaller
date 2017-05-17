if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, check, and install BLAST and taxonomy databases
if ! test -e .overall; then
wget https://www.claident.org/DBURL.txt || exit $?
wget --limit-rate=524288 -c -i DBURL.txt || exit $?
rm DBURL.txt || exit?
ls *.sha256 | xargs -L 1 -P 4 -I {} sh -c 'sha256sum -c {} || exit $?' || exit $?
ls *.tar.xz | xargs -L 1 -P 4 -I {} sh -c 'tar -xJf {} || exit $?' || exit $?
mkdir -p $PREFIX/share/claident/taxdb || sudo mkdir -p $PREFIX/share/claident/taxdb || exit $?
mv *.taxdb $PREFIX/share/claident/taxdb/ || sudo mv *.taxdb $PREFIX/share/claident/taxdb/ || exit $?
mkdir -p $PREFIX/share/claident/blastdb || sudo mkdir -p $PREFIX/share/claident/blastdb || exit $?
rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_COX1_species.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_genus.*
rm -f $PREFIX/share/claident/blastdb/animals_mt_species.* || sudo rm -f $PREFIX/share/claident/blastdb/animals_mt_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_LSU_species.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_genus.*
rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.* || sudo rm -f $PREFIX/share/claident/blastdb/eukaryota_SSU_species.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_genus.*
rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species.* || sudo rm -f $PREFIX/share/claident/blastdb/fungi_ITS_species.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_matK_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_matK_species.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_rbcL_species.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_genus.*
rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.* || sudo rm -f $PREFIX/share/claident/blastdb/plants_trnH-psbA_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_16S_species.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_genus.*
rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.* || sudo rm -f $PREFIX/share/claident/blastdb/prokaryota_all_species.*
rm -f $PREFIX/share/claident/blastdb/semiall_class.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_class.*
rm -f $PREFIX/share/claident/blastdb/semiall_order.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_order.*
rm -f $PREFIX/share/claident/blastdb/semiall_family.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_family.*
rm -f $PREFIX/share/claident/blastdb/semiall_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_genus.*
rm -f $PREFIX/share/claident/blastdb/semiall_species.* || sudo rm -f $PREFIX/share/claident/blastdb/semiall_species.*
rm -f $PREFIX/share/claident/blastdb/overall_class.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_class.*
rm -f $PREFIX/share/claident/blastdb/overall_order.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_order.*
rm -f $PREFIX/share/claident/blastdb/overall_family.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_family.*
rm -f $PREFIX/share/claident/blastdb/overall_genus.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_genus.*
rm -f $PREFIX/share/claident/blastdb/overall_species.* || sudo rm -f $PREFIX/share/claident/blastdb/overall_species.*
mv overall_class.??.n?? $PREFIX/share/claident/blastdb/ || sudo mv overall_class.??.n?? $PREFIX/share/claident/blastdb/ || exit $?
mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || sudo mv *.n.gil *.nal $PREFIX/share/claident/blastdb/ || exit $?
rm *.sha256 || exit $?
rm *.tar.xz || exit $?
touch .overall || exit $?
echo 'The "overall" family databases were installed correctly!'
fi
echo 'You do not need to care about error messages.'
