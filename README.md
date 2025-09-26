# InnovateMart EKS Deployment Assessment

## Project Overview

This repository contains the infrastructure and deployment setup for **Project Bedrock**, InnovateMart Inc.'s inaugural microservices application deployment on **Amazon EKS**. The purpose is to demonstrate cloud DevOps skills, infrastructure automation, and Kubernetes application deployment for a production-grade environment.

The Retail Store Sample Application is deployed with all microservices and in-cluster dependencies:

- **Microservices:** `carts`, `catalog`, `orders`, `checkout`, `ui`
- **Databases & Message Brokers:** MySQL, PostgreSQL, DynamoDB Local, Redis, RabbitMQ

---

## Architecture Overview

- **VPC**: Public and private subnets
- **EKS Cluster**: Managed node groups
- **IAM**: Roles for EKS cluster, node groups, and read-only developer access
- **Kubernetes**: Deployments, Services, StatefulSets, ConfigMaps, Secrets
- **Load Balancer**: `ui` service exposed externally

**Optional/Future Enhancements:**

- Replace in-cluster databases with **RDS** (MySQL/PostgreSQL) and **DynamoDB**
- Configure **AWS Load Balancer Controller, ALB ingress, custom domain, SSL/TLS**

---

## Prerequisites

Before running the infrastructure and deploying the app, ensure the following tools are installed:

- [Terraform](https://www.terraform.io/downloads)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with permissions to create EKS resources


Please note that my first set of AWS access keys were accidentally exposed in a commit. I have since deleted those credentials in AWS IAM, generated a new secure set of keys via Terraform, and updated my .gitignore to ensure no sensitive information is ever pushed again. The repository now only contains clean Terraform IaC code, Kubernetes manifests, and CI/CD configurations as intended.