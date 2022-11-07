# Imposters

## Local Development

### Run Mountebank locally

To run Mountebank as standalone container image, follow these steps

````shell
docker pull bbyars/mountebank:2.8.1
docker run -d -p 2525:2525 -p 4545:4545 -p 5555:5555 bbyars/mountebank:2.8.1 start
````

### Deploy Imposter
````shell
curl -i -X POST -H 'Content-Type: application/json' http://localhost:2525/imposters --data @definition/planets-list.json
````

### Test Imposter
````shell
curl -sS -X GET -H 'Accept: application/json' http://localhost:4545/v1/planets | jq .
````

### Delete Imposter
````shell
curl -X DELETE http://localhost:2525/imposters/4545
````
