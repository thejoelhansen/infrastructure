#! /bin/bash

# get gc project name & id
gc_project=$(gcloud config get-value project)
gc_project_id=$(gcloud projects describe $(gcloud config get-value project) --format="value(projectNumber)")

# set preferred default region & zone during development
# gcloud config set compute/region us-west1
# gcloud config set compute/zone us-west1-a
