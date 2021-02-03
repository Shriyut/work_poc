FROM gcr.io/apigee-microgateway/edgemicro:3.0.2

USER root

WORKDIR /opt/apigee

RUN apk add curl 

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin

RUN apk add python3 

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

EXPOSE 8000
EXPOSE 8443

COPY ./microgateway/microgateway_v3.0.2_Linux_x86_64 /opt/apigee/microgateway_v3.0.2_Linux_x86_64
COPY ./.edgemicro /opt/apigee/.edgemicro
