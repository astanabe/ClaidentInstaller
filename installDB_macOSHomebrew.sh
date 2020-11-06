if test -z $PREFIX; then
export PREFIX=/usr/local || exit $?
fi
# download, check, and install BLAST and taxonomy databases
if ! test -e .overall; then
wget -c https://www.claident.org/DBURL.txt.xz || exit $?
rm -f DBURL.txt || exit $?
xz -d DBURL.txt.xz || exit $?
wget --limit-rate=5242880 -c -i DBURL.txt || exit $?
rm -f DBURL.txt || exit $?
ls "*.sha256" | xargs -L 1 -P 4 -I {} sh -c 'gsha256sum -c {} || exit $?' || exit $?
ls "*.tar.xz" | xargs -L 1 -P 4 -I {} sh -c 'gtar -xJf {} || exit $?' || exit $?
mkdir -p $PREFIX/share/claident/taxdb || sudo mkdir -p $PREFIX/share/claident/taxdb || exit $?
rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_COX1_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/animals_COX1_species.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/animals_mt_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/animals_mt_species.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_LSU_species.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/eukaryota_SSU_species.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/fungi_ITS_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_matK_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_matK_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_rbcL_species.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/plants_trnH-psbA_species.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_16S_species.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/prokaryota_all_species.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_class.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/semiall_class.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_order.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/semiall_order.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_family.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/semiall_family.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/semiall_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/semiall_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/semiall_species.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_class.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/overall_class.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_order.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/overall_order.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_family.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/overall_family.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_genus.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/overall_genus.taxdb
rm -f $PREFIX/share/claident/taxdb/overall_species.taxdb || sudo rm -f $PREFIX/share/claident/taxdb/overall_species.taxdb
mv "*.taxdb" $PREFIX/share/claident/taxdb/ || sudo mv "*.taxdb" $PREFIX/share/claident/taxdb/ || exit $?
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
mv "overall_class.??.n??" $PREFIX/share/claident/blastdb/ || sudo mv "overall_class.??.n??" $PREFIX/share/claident/blastdb/ || exit $?
mv "*.bsl" "*.nal" $PREFIX/share/claident/blastdb/ || sudo mv "*.bsl" "*.nal" $PREFIX/share/claident/blastdb/ || exit $?
rm "*.sha256" || exit $?
rm "*.tar.xz" || exit $?
touch .overall || exit $?
echo 'The "overall" family databases were installed correctly!'
fi
echo 'You do not need to care about error messages.'
