#!/bin/sh

until curl -I mountebank-svc; do
  echo "Waiting for mountebank server to be ready...."
  sleep 2
done


for filename in definition/*.json; do
  printf "Loading %s.json\n" $(basename "$filename" .json)
  curl -X POST -H "Content-Type: application/json" -d @definition/$(basename "$filename" .json).json http://mountebank-svc:2525/imposters
done
