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
  - [Configuration](#configuration)
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

- [Tekton](https://tekton.dev/): A Kubernetes-native open-source framework for creating continuous integration and delivery (CI/CD) systems.
- [Kubernetes](https://kubernetes.io/): An open-source container orchestration platform for automating the deployment, scaling, and management of containerized applications.
- [Google Cloud Platform (GCP)](https://cloud.google.com/): A suite of cloud computing services provided by Google, including compute, storage, networking, and more.
- [WordPress](https://wordpress.org/): A popular open-source content management system (CMS) for creating websites and blogs.
- [Terraform](https://www.terraform.io/): An open-source infrastructure as code software tool that enables you to define and provision infrastructure resources using declarative configuration files.
- [Docker](https://www.docker.com/): An open-source platform that allows you to automate the deployment, scaling, and management of applications using containerization.

These technologies work together to provide a robust and scalable solution for deploying and managing WordPress instances in the cloud. Tekton is used for creating CI/CD pipelines, Kubernetes handles the container orchestration, GCP provides the underlying cloud infrastructure, WordPress powers the content management, and Terraform and Docker are used for infrastructure provisioning and containerization, respectively.

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

### Configuration

First, you need to configure the secret in repo:

- `GCP_PROJECT_ID`: Your GCP project ID.
- `GCP_CREDENTIALS` : you JSON key for authentication a coded with base64.
- `CLUSTER_NAME`: The name of your Kubernetes cluster in GCP.
- `GH_TOKEN`: Your token with permision on webhook or repo management. 
- `DOCKER_USERNAME`: Your username in Docker Hub.
- `DOCKER_PASSWORD`: Your password in Docker Hub.
Make sure the specified parameters align with your environment and requirements.
### Installation

To deploy WordPress with Tekton, follow these steps:

1. Clone this repository to your local machine:

```shell
git clone https://github.com/dmonakh/Wordpress-Tekton-atK8s-inGCP.git
```

2. "text"

3. Modify the configuration settings in the `Deploy.yml` file according to your environment and requirements.

4. Create and configure the secrets required for accessing the database and other resources.

5. text

6. Navigate to the `terraform_gcp` directory.

7. Edit the `variables.tf` file and fill in the required variables for your environment.

8. Edit script `create-bucket.sh` and `beckend.tf` to store the Terraform state.

9. "text"

10. Open the `.github/workflows/terraform.yml` file and make the following changes: "text"

11. Commit and push all the changes to the repository.

12. GitHub Actions will automatically trigger the pipeline to deploy the infrastructure in GCP.

13. Wait for the pipeline to complete successfully to ensure the infrastructure is created successfully.

## Usage

After deploying the infrastructure using Terraform and GitHub Actions, you wait and check GitHub Action.

After step `Create empty commit` the tekton pipeline will automatically create and configure the necessary resources for deploying WordPress in your GCP project. 
You can track the progress of the pipeline execution through the Tekton dashboard or the command line.  

Run: `kubectl --namespace tekton-pipelines port-forward svc/tekton-dashboard 9097:9097`

Open: [Tekton Dashboard](http://127.0.0.1:9097/#/namespaces/default/pipelineruns) for reviewing the pipeline run.

If step `Check Service` in GitHub Action shows an external IP for WordPress and the link works, well done! 
(Note: You can open this ip in your browser and get your site. But the display of the site will not be correct until you connect the domain)

After that, you need to create an A record in your registered Domain and wait about for 72 hours to check if the site works for your Domain.  
(You can use [This Service](https://mxtoolbox.com/SuperTool.aspxto) track the update of your domain’s DNS records)
## Roadmap

...

## Support

...

## Project Assistance

...

## Contributing

...

## Authors & Contributors

...

## Security

...

## License 

This project is licensed under the **GNU General Public License v3**.

See [LICENSE](LICENSE) for more information.