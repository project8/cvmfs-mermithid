FROM project8/cvmfs-dependencies-mermithid:build-2018-04-12

ENV MERMITHIDBRANCH=v0.0.1

RUN mkdir -p /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}

COPY ./setup.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh
COPY ./download_pkg.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh
COPY ./install.sh /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh

# sleep for 1s added to avoid weird "text file busy" error when building on docker hub
RUN source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/setup.sh && \
    source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/download_pkg.sh && \
    source /cvmfs/hep.pnnl.gov/project8/mermithid/${MERMITHIDBRANCH}/install.sh
