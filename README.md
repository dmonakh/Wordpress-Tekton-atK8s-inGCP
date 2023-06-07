# WordPress with Tekton on GCP

This repository contains configuration examples and templates for deploying WordPress on GCP using Tekton.

## Table of Contents

- [Description](#description)
- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Infrastructure Deployment](#infrastructure-deployment)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description

This project provides infrastructure files and templates for deploying WordPress on GCP using the Tekton tool. Tekton allows you to automate CI/CD processes and create a reliable and scalable pipeline for application development and delivery.

## Requirements

To implement this project, you will need the following components and accounts:

- GCP account with a configured project and access to the necessary resources.
- GCP service account with IAM administrator privileges and a JSON key for authentication.
- Docker Hub account (or another container registry) to store container images.
- GitHub account for code storage and automation configuration.
- GitHub token for accessing the repository and performing repository operations.
- Domain registered with a domain registrar (e.g., Cloudflare) for DNS configuration.

Make sure you have all the required accounts and components for a successful project implementation.

## Installation

To deploy WordPress with Tekton, follow these steps:

1. Clone this repository to your local machine:

```shell
git clone https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP.git
```


2. Install and configure the necessary components according to the Tekton documentation.

3. Modify the configuration settings in the `config.yaml` file according to your environment and requirements.

4. Create and configure the secrets required for accessing the database and other resources.

5. Deploy the infrastructure in GCP using Terraform and GitHub Actions following the steps mentioned below.

## Infrastructure Deployment

Before running the Tekton pipeline, you need to deploy the infrastructure in GCP using Terraform and GitHub Actions:

1. Navigate to the `terraform` directory.

2. Edit the `terraform.tfvars` file and fill in the required variables for your environment.

3. Create a new repository in GitHub to store the Terraform state and copy its URL.

4. In the GitHub repository that contains the infrastructure code, create a new secret named `GCP_SA_KEY` with the value of the GCP service account JSON key.

5. Open the `.github/workflows/terraform.yaml` file and make the following changes:
- Replace `GITHUB_REPOSITORY` with the URL of your Terraform state repository.
- Replace `terraform-organization` with your Terraform Cloud organization (if applicable).

6. Commit and push all the changes to the repository.

7. GitHub Actions will automatically trigger the pipeline to deploy the infrastructure in GCP.

8. Wait for the pipeline to complete successfully to ensure the infrastructure is created successfully.

## Configuration

Before running the pipeline, you need to configure the following parameters:

- `PROJECT_ID`: Your GCP project ID.
- `CLUSTER_NAME`: The name of your Kubernetes cluster in GCP.
- `DATABASE_HOST`: The WordPress database host.
- `DATABASE_USERNAME`: The username for the database.
- `DATABASE_PASSWORD`: The password for the database user.

Make sure the specified parameters align with your environment and requirements.

## Usage

After deploying the infrastructure using Terraform and GitHub Actions, you can run the Tekton pipeline to deploy WordPress by executing the following command:

```shell
kubectl apply -f pipeline.yaml
```

The pipeline will automatically create and configure the necessary resources for deploying WordPress in your GCP project. You can track the progress of the pipeline execution through the Tekton dashboard or the command line.

## Contributing


