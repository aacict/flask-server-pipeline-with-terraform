# Flask Server with Terraform & GitHub Actions

[![GitHub Workflow](https://img.shields.io/github/actions/workflow/status/aacict/flask-server-pipeline-with-terraform/docker-build-push.yml?branch=main)](https://github.com/aacict/flask-server-pipeline-with-terraform/actions)
[![Terraform Version](https://img.shields.io/badge/Terraform-1.12.2-blue)](https://www.terraform.io/)
[![Docker](https://img.shields.io/badge/Docker-28.2.2-blue?logo=docker)](https://www.docker.com/)

This repository demonstrates deploying a **Flask API** using **Docker**, **Terraform**, and **GitHub Actions**. The Flask app is packaged as a Docker image, pushed to **GitHub Container Registry (GHCR)**, and deployed to **AWS EC2 / Elastic Beanstalk** via Terraform.

---

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Clone the Repo](#clone-the-repo)
  - [Terraform Deployment](#terraform-deployment)
- [GitHub Actions Workflow](#github-actions-workflow)
- [Public Docker Image](#public-docker-image)
- [License](#license)

---

## Features

- Flask API packaged with **Docker**
- Deployable to **AWS EC2 / Elastic Beanstalk** using Terraform
- Continuous integration using **GitHub Actions**
- Supports automatic updates via Docker image pull
- Public Docker image hosted on **GitHub Container Registry (GHCR)**

---

## Architecture

```
GitHub Actions
      │
      ├─ Build & Push Docker Image → GHCR (Public, with PAT secrets can be private)
      │
Terraform
      │
      └─ Deploy EC2 / Elastic Beanstalk → Pull Docker Image → Run Flask API
```

## Getting Started

#### Prerequisites:::

- Docker installed locally.
- Terraform installed.
- AWS account with proper permissions (EC2, VPC, IAM) (Note: Used root account).
- GitHub account for CI/CD and GHCR.

#### Process to replicate:::

- Clone the Repo using: `git clone https://github.com/aacict/flask-server-pipeline-with-terraform.git`
- `cd flask-server-pipeline-with-terraform`
- Terraform Deployment
  - Configure your AWS credentials using: `Aws configure`
  - Initialize Terraform using `terraform init`
  - Apply Terraform configuration - deploy EC2 / Elastic Beanstalk using `terraform apply -var="ghcr_pat=<YOUR_GITHUB_PAT>"`. If the Docker image is public, the ghcr_pat variable is not required.

#### Terraform will create:::

- EC2 instance with Docker installed
- EC2 user_data to pull and run the Flask Docker image

#### GitHub Actions Workflow:::

file: [.github/workflows/docker-build-push.yml](https://github.com/aacict/flask-server-pipeline-with-terraform/actions/runs/17007636174/workflow)

Steps:

1. Checkout repository.
2. Log in to GHCR.
3. Build Docker image from ./app.
4. Push Docker image to GHCR.

###### (Optional) SSH into EC2 to pull latest image

With a public GHCR image, the EC2 instance can pull the image without authentication.

###### Public Docker Image

Image Name: ghcr.io/aacict/flask-server:latest
Can be pulled with: `docker pull ghcr.io/aacict/flask-server:latest`
`docker run -d -p 5000:5000 ghcr.io/aacict/flask-server:latest`

- - -

