FROM ubuntu:trusty

ENV PACKER_VERSION=1.6.4
ENV TERRAFORM_VERSION=0.13.5
ENV ANSIBLE_VERSION=2.9.15

RUN apt update
RUN apt install -y git bash wget unzip openssl python3 python3-pip
RUN pip3 install ansible==${ANSIBLE_VERSION}

ADD https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip ./
ADD https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip ./

RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip
RUN rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
