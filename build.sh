#!/bin/sh
set -e
cd $(dirname $0)

case $( uname -m ) in
armv7l)
  REPO="angelnu/docker-smtp-arm"
  ;;
x86_64)
  REPO="angelnu/docker-smtp-amd64"
  ;;
*)
  echo "Unknown arch $( uname -p )"
  exit 1
  ;;
esac

docker build -t $REPO .
docker push $REPO
