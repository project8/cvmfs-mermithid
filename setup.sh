# define what dependencies and what version of morpho to look for
export P8DEPMERMITHIDBUILD=build-2018-04-12
export MERMITHIDBRANCH=v0.0.1

# source dependencies
source /cvmfs/hep.pnnl.gov/project8/dependencies-mermithid/${P8DEPMERMITHIDBUILD}/setup.sh 

export P8MERMITHIDBASEDIR=${P8BASEDIR}/mermithid/${MERMITHIDBRANCH}
export PATH=${P8MERMITHIDBASEDIR}/bin:${PATH}
export PYTHONPATH=${P8MERMITHIDBASEDIR}/lib/python3.6/site-packages:${PYTHONPATH} 


# CICADA and PHYLLOXERA
export PYTHONPATH=${P8MERMITHIDBASEDIR}:${PYTHONPATH}
export PATH=${P8MERMITHIDBASEDIR}/bin:${PATH}
export LD_LIBRARY_PATH=${P8MERMITHIDBASEDIR}/lib:${LD_LIBRARY_PATH}
