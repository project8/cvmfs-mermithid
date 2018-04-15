# define what dependencies and what version of morpho to look for
export MERMITHIDBRANCH=v0.0.1

# get the location of this script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create the mermithid build directory
mkdir -p /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}

# copy in the setup and install scripts
mv ${SCRIPT_DIR}/setup.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh
mv ${SCRIPT_DIR}/download_pkg.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
mv ${SCRIPT_DIR}/install.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh

# setup the environment and run the install script
source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
chmod +x /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh
/cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
/cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh
