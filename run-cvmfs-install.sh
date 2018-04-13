# define what dependencies and what version of morpho to look for
export P8MERMITHIDBUILD=build-2018-04-12
export MERMITHIDBRANCH=v0.0.1

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the mermithid build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}

# copy in the setup and install scripts
cp ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh
cp ${SCRIPT_DIR}/download_pkg.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
cp ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh

# setup the environment and run the install script
source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh
source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh
