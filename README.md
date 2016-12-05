# Introduction
An example of integrating VisTrails and docker.

# Usage
### Hardcoded Nigeria
    docker pull justinlovinger/tb-wf:nigeria
    docker run justinlovinger/tb-wf:nigeria

### Parameterized
    docker pull justinlovinger/tb-wf:parameterized
    docker run justinlovinger/tb-wf:parameterized country=COUNTRY_NAME

Replacing COUNTRY_NAME with the country you want to obtain the average e_inc_100k value of.

# Dockerhub Repository
https://hub.docker.com/r/justinlovinger/tb-wf/
