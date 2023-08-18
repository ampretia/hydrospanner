#!/bin/bash
set -ex -o pipefail

# the directory of the script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# the temp directory used, within $DIR
# omit the -p parameter to create a temporal directory in the default location
WORK_DIR=`mktemp -d -p "$DIR"`

# check if tmp dir was created
if [[ ! "$WORK_DIR" || ! -d "$WORK_DIR" ]]; then
  echo "Could not create temp dir"
  exit 1
fi

# deletes the temp directory
function cleanup {      
  rm -rf "$WORK_DIR"
  echo "Deleted temp working directory $WORK_DIR"
}

# register the cleanup function to be called on the EXIT signal
trap cleanup EXIT

# clone project
git clone https://github.com/ampretia/hydrospanner.git "${WORK_DIR}"
pushd "${WORK_DIR}"

tobuild=$1
if [ -d "${tobuild}" ] 
then
    echo "Buildling: ${tobuild}" 
else
    echo "Error: Directory ${tobuild} does not exists."
    exit 1
fi

export tobuild
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) -t hydrospanner-${tobuild} --file ${tobuild}/dockerfile ${tobuild}
cat ${DIR}/run.tmpl | envsubst > $HOME/.local/bin/hs${tobuild}
chmod +x $HOME/.local/bin/hs${tobuild}
echo "Installed 'hs${tobuild}' to $HOME/.local/bin"
popd
