# Project 8 CVMFS Mermithid installation

This repository can be used in two ways:

1. To install on the actual CVMFS system, use the `run-cvmfs-install.sh` script
1. To use the docker mockup CVMFS system, use the Dockerfile

When updating the mermithid build on GitHub, please make sure that both `run-cvmfs-install.sh` and `Dockerfile` get updated.  
When a new official build is ready, tag it with the build name (the same as the build directory)

## Information

This repository provides the installation of mermithid on the CVMFS system used on the PNNL HEP cluster.

It's based on the CVMFS-dependencies-mermithid image (https://hub.docker.com/r/project8/cvmfs-dependencies-mermithid).

Project 8 software is installed in the `/cvmfs/hep.pnnl.gov/project8` directory.  From there, installed python packages go in the `mermithid` subdirectory.  
For any images based on this image, their software should go in their own directories to avoid issues with directory names that change as builds are updated.  
For example:

```
/cvmfs/hep.pnnl.gov/project8
   |
   +- dependencies-common

   |
   +- dependencies-mermithid

   |
   +- katydid
   |
   +- mermithid
   |     |
   |     +- current --> v0.0.1
   |     |
   |     +- v0.0.1
   |           |
   |           +- AUTHORS, bin, Dockerfile, ... (mermithid source code)
   |           |
   |           +- install.sh
   |           |
   |           +- setup.sh
   . . .
```

## Testing a release branch

1. Set the appropriate Mermithid branch or tag in Dockerfile (environment variable `MERMITHIDBRANCH`):
1. Set the branch to `release/[version]`:
    1. Uncomment the `ENV MERMITHIDBRANCH=release/[version]` line
    1. Comment out the line that uses a tag, `ENV MERMITHIDBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies-mermithid` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, go ahead with the mermithid release, but don't push these changes to cvmfs-mermithid:master.

## Updating mermithid with a new tagged release

1. Set the appropriate mermithid branch or tag in Dockerfile (environment variable `MERMITHIDBRANCH`):
1. Set the branch to the tag name, `v[version]`:
    1. Comment out the `ENV MERMITHIDBRANCH=v[version]` line
    1. Uncomment the line that uses a tag, `ENV MERMITHIDBRANCH=v[version]`
1. If using a new version of the `cvmfs-dependencies-mermithid` base image, update that in the `FROM` line in Dockerfile
1. Build the container locally
1. If the build works, push these changes to cvmfs-mermithid:master
1. On the Docker Hub page for the `project8/cvmfs-mermithid` image, go to Build Settings
1. Trigger a rebuild of both containers (`latest` and same-as-tag)
1. Make sure that the Docker Hub build works
1. If the build works, notify the DIRAC team that mermithid needs to be pushed to CVMFS, and provide the mermithid tag name.
