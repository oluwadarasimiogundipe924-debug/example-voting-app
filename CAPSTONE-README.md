# DevOps Capstone 1 — Voting Application

## Project Overview
This project demonstrates Docker containerization, Kubernetes deployment,
Helm release management, Terraform configuration validation, and CI image
security scanning.

## Application Architecture
The application consists of:
- Vote: accepts votes from users.
- Redis: queues votes.
- Worker: processes votes and stores them in PostgreSQL.
- PostgreSQL: stores voting data.
- Result: displays voting results.

## Run Locally with Docker Compose
Build and start the application:

    docker compose up --build

- Vote application: http://localhost:8080
- Results application: http://localhost:8081

Stop the application with Ctrl+C in the foreground terminal.

## Kubernetes and Helm
The application was deployed to a local Kind Kubernetes cluster in the
voting namespace.

Useful commands:

    kubectl get nodes
    kubectl get pods,services -n voting
    helm lint helm/voting-app
    helm history voting-app -n voting
    helm status voting-app -n voting

A Helm rollback was performed and its history was captured as evidence.

## Terraform
Terraform configuration validation was performed locally:

    terraform -chdir=terraform validate

Validation does not mean cloud infrastructure has been provisioned.

## CI and Security
The GitHub Actions workflow builds the vote, result, and worker images and
scans them with Trivy for high and critical vulnerabilities. Image publishing
depends on the workflow succeeding and the required repository secrets being
configured.

## Evidence
The evidence directory contains captured output from Kubernetes, Helm,
and Terraform validation.

## Deployment Scope
The Kubernetes deployment demonstrated in this project uses a local Kind
cluster. A cloud deployment has not been completed. Cloud deployment would
require suitable credentials and may incur charges.

## Security Notes
Do not commit access tokens, private keys, cloud credentials, or Terraform
state files to the repository.
