# define what dependencies and what version of mermithid to look for
export P8DEPMERMITHIDBUILD=build-2018-07-26
export MERMITHIDBUILD=v1.0.5

# source dependencies
source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh 

export P8MERMITHIDBASEDIR=${P8BASEDIR}/mermithid/${MERMITHIDBUILD}
export PATH=${P8MERMITHIDBASEDIR}/bin:${PATH}
export PYTHONPATH=${P8MERMITHIDBASEDIR}/lib/python3.6/site-packages:${PYTHONPATH} 

# CICADA and PHYLLOXERA
export PYTHONPATH=${P8MERMITHIDBASEDIR}:${P8MERMITHIDBASEDIR}/lib:${PYTHONPATH}
export PATH=${P8MERMITHIDBASEDIR}/bin:${PATH}
export LD_LIBRARY_PATH=${P8MERMITHIDBASEDIR}/lib:${LD_LIBRARY_PATH}
