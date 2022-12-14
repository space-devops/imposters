#!/bin/sh

echo "Sleeping for 30 seconds"
sleep 30

for filename in definition/*.json; do
  printf "Loading %s.json\n" $(basename "$filename" .json)
  curl -X POST -H "Content-Type: application/json" -d @definition/$(basename "$filename" .json).json http://mountebank-svc:2525/imposters
done
