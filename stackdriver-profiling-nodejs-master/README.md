# stackdriver-profiling-nodejs

This setup was implemented on GCP, if you're implementing it from outside GCP index.js file needs to be edited respectively

https://github.com/googleapis/cloud-profiler-nodejs

https://cloud.google.com/profiler/docs/profiling-nodejs

Install docker

To test with containers we will need a service account with the role roles/cloudprofiler.agent

The key of the service account needs to be uploaded as a secret to the kubernetes cluster

Make sure that cloudprofiler API has been enabled

gcloud services enable cloudprofiler.googleapis.com --project=${gcp_project_id}

Create the service account

gcloud iam service-accounts create sa-secret --display-name=sa-secret

Generate key for the service account

gcloud iam service-accounts keys create ./sa-secret.key.json --iam-account=sa-secret@{project_id}.iam.gserviceaccount.com --project=${gcp_project_id}

gcloud projects add-iam-policy-binding ${gcp_project_id} --member=serviceAccount:sa-secret@{project_id}.iam.gserviceaccount.com --roles=roles/cloudprofiler.agent

Upload service account key to kubernetes by generating a secret

kubectl create secret generic sa-secret-key --from-file=sa-secret.key.json=${PWD}/sa-secret.key.json

Create all the necessary files for the POC

Build the docker image

sudo docker build --tag=gcr.io/{gcp_project_id}/nodejs-profiler .

Push the image to GCR
( service account of vm should have storage admin permission to push to gcr)

gcloud auth configure-docker

sudo gcloud docker -- push gcr.io/{gcp_project_id}/nodejs=profiler

Run the image

sudo docker run --env=GOOGLE_APPLICATION_CREDENTIALS=/key.json \
--volume=$PWD/sa-secret.key.json:/key.json \
--publish=8080:8080 \
gcr.io/{gcp_project_id}/nodejs-profiler

