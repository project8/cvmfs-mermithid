#!/bin/bash

# It's assumed that you've already sourced the relevant setup.sh

echo "Environment variables after installing python:"
env
echo `which python3`
echo `python3 -V`

echo `gcc --version`
echo `python3 --version`

echo `which cc`
echo `which g++`
echo `which ld`

echo "LD_LIBRARY_PATH: $LD_LIBRARY_PATH"
echo "LIBRARY_PATH: $LIBRARY_PATH"
echo "LIBDIR: $LIBDIR"
echo "PYTHONPATH: $PYTHONPATH"
echo "Library search path:"
echo `ldconfig -v 2>/dev/null | grep -v ^$'\t'`

echo "Installing Dependencies"
mkdir -p ${P8MERMITHIDBASEDIR}/src/mermithid/my_build
cd ${P8MERMITHIDBASEDIR}/src/mermithid/my_build
ls ../
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDBASEDIR} \
      -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True \
      -DCicada_ADD_CICADA_PY=True ..
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=${P8MERMITHIDBASEDIR} \
      -DCMAKE_SKIP_INSTALL_RPATH:BOOL=True \
      -DCicada_ADD_CICADA_PY=True ..
make -j3
make install

cd ${P8MERMITHIDBASEDIR}/src/mermithid

# echo "Installing Mermithid"

which pip3

echo "${P8MERMITHIDBASEDIR}/bin/pip3 install --prefix=${P8MERMITHIDBASEDIR} . --process-dependency-links"
pip3 install --prefix=${P8MERMITHIDBASEDIR} . --process-dependency-links

echo "Adding new 'current' soft link"
ln -sf ${P8MERMITHIDBASEDIR} ${P8BASEDIR}/mermithid/current
