<h1 align="center">
  <a href="https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP">
    <img src="docs/images/logo.svg" alt="Logo" width="100" height="100">
  </a>
</h1>

<div align="center">
  Wordpress-Tekton-atK8s-inGCP
  <br />
  <a href="#about"><strong>Explore the docs »</strong></a>
  <br />
  <br />
  <a href="https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP/issues/new?assignees=&labels=bug&template=01_BUG_REPORT.md&title=bug%3A+">Report a Bug</a>
  ·
  <a href="https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP/issues/new?assignees=&labels=enhancement&template=02_FEATURE_REQUEST.md&title=feat%3A+">Request a Feature</a>
  ·
  <a href="https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP/issues/new?assignees=&labels=question&template=04_SUPPORT_QUESTION.md&title=support%3A+">Ask a Question</a>
</div>

<div align="center">
<br />

[![Project license](https://img.shields.io/github/license/dmonakh/Wordpress-Tekton-atK8s-inGCP.svg?style=flat-square)](LICENSE)

[![Pull Requests welcome](https://img.shields.io/badge/PRs-welcome-ff69b4.svg?style=flat-square)](https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP/issues?q=is%3Aissue+is%3Aopen+label%3A%22help+wanted%22)
[![code with love by dmonakh](https://img.shields.io/badge/%3C%2F%3E%20with%20%E2%99%A5%20by-dmonakh-ff1414.svg?style=flat-square)](https://github.com/dmonakh)

</div>

<details open="open">
<summary>Table of Contents</summary>

- [About](#about)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Usage](#usage)
- [Roadmap](#roadmap)
- [Support](#support)
- [Project Assistance](#project-assistance)
- [Contributing](#contributing)
- [Authors & Contributors](#authors--contributors)
- [Security](#security)
- [License](#license)

</details>

---
## About

This project provides infrastructure files and templates for deploying WordPress on GCP using the Tekton tool. Tekton allows you to automate CI/CD processes and create a reliable and scalable pipeline for application development and delivery.

### Built With

The project is built using the following technologies:

- [Tekton](https://tekton.dev/) - A Kubernetes-native open-source framework for creating continuous integration and delivery (CI/CD) systems.
- [Kubernetes](https://kubernetes.io/) - An open-source container orchestration platform for automating the deployment, scaling, and management of containerized applications.
- [Google Cloud Platform (GCP)](https://cloud.google.com/) - A suite of cloud computing services provided by Google, including compute, storage, networking, and more.
- [WordPress](https://wordpress.org/) - A popular open-source content management system (CMS) for creating websites and blogs.

## Getting Started
### Prequirements

To implement this project, you will need the following components and accounts:

- GCP account with a configured project and access to the necessary resources.
- GCP service account with IAM administrator privileges and a JSON key for authentication.
- Docker Hub account (or another container registry) to store container images.
- GitHub account for code storage and automation configuration.
- GitHub token for accessing the repository and performing repository operations.
- Domain registered with a domain registrar (e.g., Cloudflare) for DNS configuration.

Make sure you have all the required accounts and components for a successful project implementation.

### Installation

To deploy WordPress with Tekton, follow these steps:

1. Clone this repository to your local machine:

```shell
git clone https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP.git
```


2. Install and configure the necessary components according to the Tekton documentation.

3. Modify the configuration settings in the `config.yaml` file according to your environment and requirements.

4. Create and configure the secrets required for accessing the database and other resources.

5. Deploy the infrastructure in GCP using Terraform and GitHub Actions following the steps mentioned below.

### Infrastructure Deployment

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

### Configuration

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


