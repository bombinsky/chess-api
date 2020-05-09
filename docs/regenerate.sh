#!/bin/bash

date=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "${date}: Generating API Documentation"
raml2html ./api.raml > ./api.html
