#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

########################################################################
#
# collect source distributions for all submodules
#
########################################################################

# GITHUB TOKEN
export GITHUB_TOKEN=da54a35461cf3993743a6772f88959a6d2a4ad8b
export GITHUB_USER=project8-machine

export MERMITHID_BRANCH=e06e902621121786ecf034daf544ecc990a5d3ec
export PHYLLOXERA_BRANCH=d361adad61b9740be39862a4cbd6883e3aa9adb0
export CICADA_BRANCH=9b3bf22244263e01701484186c3fb18f6ef26e67
export SCARAB_BRANCH=216a11c7831817550201709514ba9fae126f1586
export RAPIDJSON_BRANCH=5de06bfa37495b529dc00139f1b138a526fff27a
export YAMLCPP_BRANCH=3757b2023b71d183a341677feee693c71c2e0766

export MERMITHID_URL=https://github.com/project8/mermithid/archive/${MERMITHID_BRANCH}.zip
export PHYLLOXERA_URL=https://github.com/project8/phylloxera/archive/${PHYLLOXERA_BRANCH}.zip
export CICADA_URL=https://github.com/project8/cicada/archive/${CICADA_BRANCH}.zip
export SCARAB_URL=https://github.com/project8/scarab/archive/${SCARAB_BRANCH}.zip
export RAPIDJSON_URL=https://github.com/Tencent/rapidjson/archive/${RAPIDJSON_BRANCH}.zip
export YAMLCPP_URL=https://github.com/jbeder/yaml-cpp/archive/${YAMLCPP_BRANCH}.zip

# get into the parent directory for all the source code and build proucts
cd ${P8MERMITHIDBASEDIR}
mkdir -p ${P8MERMITHIDBASEDIR}/src
cd ${P8MERMITHIDBASEDIR}/src
pwd

# Because Git does not exist, we have to download manually all items and put them at the right place. 
# How annoying...
echo "Prepare Mermithid"
wget -O mermithid-${MERMITHID_BRANCH}.zip ${MERMITHID_URL} --output-file=wget_log.txt --tries=3
unzip -q mermithid-${MERMITHID_BRANCH}.zip
mv mermithid-${MERMITHID_BRANCH} mermithid

echo "Prepare Scarab"
wget -O scarab-${SCARAB_BRANCH}.zip ${SCARAB_URL} --output-file=wget_log.txt --tries=3
unzip -q scarab-${SCARAB_BRANCH}.zip
mv scarab-${SCARAB_BRANCH} ${P8MERMITHIDBASEDIR}/src/Scarab
echo "Rapidjson for Scarab"
wget -O rapidjson-${RAPIDJSON_BRANCH}.zip ${RAPIDJSON_URL} --output-file=wget_log.txt --tries=3
unzip -q rapidjson-${RAPIDJSON_BRANCH}.zip
mv rapidjson-${RAPIDJSON_BRANCH} ${P8MERMITHIDBASEDIR}/src/rapidjson
mkdir -p ${P8MERMITHIDBASEDIR}/src/Scarab/library/param/codec/json
mv ${P8MERMITHIDBASEDIR}/src/rapidjson ${P8MERMITHIDBASEDIR}/src/Scarab/library/param/codec/json
echo "yaml-cpp for Scarab"
wget -O yaml-cpp-${YAMLCPP_BRANCH}.zip ${YAMLCPP_URL} --output-file=wget_log.txt --tries=3
unzip -q yaml-cpp-${YAMLCPP_BRANCH}.zip
mv yaml-cpp-${YAMLCPP_BRANCH} ${P8MERMITHIDBASEDIR}/src/yaml-cpp
mkdir -p ${P8MERMITHIDBASEDIR}/src/Scarab/library/param/codec/yaml
mv ${P8MERMITHIDBASEDIR}/src/yaml-cpp ${P8MERMITHIDBASEDIR}/src/Scarab/library/param/codec/yaml
echo "Scarab is ready!"

echo "Prepare Phylloxera"
wget -O phylloxera-${PHYLLOXERA_BRANCH}.zip ${PHYLLOXERA_URL} --output-file=wget_log.txt --tries=3
unzip -q phylloxera-${PHYLLOXERA_BRANCH}.zip
mv phylloxera-${PHYLLOXERA_BRANCH} ${P8MERMITHIDBASEDIR}/src/Phylloxera
cp -r ${P8MERMITHIDBASEDIR}/src/Scarab ${P8MERMITHIDBASEDIR}/src/Phylloxera
mv ${P8MERMITHIDBASEDIR}/src/Phylloxera ${P8MERMITHIDBASEDIR}/src/mermithid
echo "Phylloxera is done!"

echo "Prepare Cicada"
wget -O cicada-${CICADA_BRANCH}.zip ${CICADA_URL} --output-file=wget_log.txt --tries=3
unzip -q cicada-${CICADA_BRANCH}.zip
mv cicada-${CICADA_BRANCH} ${P8MERMITHIDBASEDIR}/src/Cicada
cp -r ${P8MERMITHIDBASEDIR}/src/Scarab ${P8MERMITHIDBASEDIR}/src/Cicada
mv ${P8MERMITHIDBASEDIR}/src/Cicada ${P8MERMITHIDBASEDIR}/src/mermithid
echo "Cicada is done!"
