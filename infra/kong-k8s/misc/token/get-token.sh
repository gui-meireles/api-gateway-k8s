#!/bin/bash
kubectl exec -it testcurl -- sh

curl --location --request POST 'http://keycloak.iam/realms/bets/protocol/openid-connect/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'client_id=kong' \
--data-urlencode 'grant_type=password' \
--data-urlencode 'username=guilherme' \
--data-urlencode 'password=Unicom@10' \
--data-urlencode 'client_secret=nXKx0l671FeBosoc1WdbeNzZH1tGsOtN' \
--data-urlencode 'scope=openid'