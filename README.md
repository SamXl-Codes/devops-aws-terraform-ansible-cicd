# AWS + Terraform + Ansible + GitHub Actions (DevOps CA)


# End-to-End DevOps Deployment Pipeline — Terraform · Ansible · Docker · GitHub Actions · AWS EC2

### Author: **Samuel Ogunlusi**
**Course:** MSc In Cybersecurity— Dublin business School (DBS)
**Module:** Network Systems & Administration  
**Project:** Continuous Integration & Continuous Deployment (CI/CD) for a Flask Portfolio Application  
**Cloud Platform:** Amazon Web Services (AWS)

---

## Overview

This project implements a **complete DevOps automation pipeline** — from infrastructure provisioning to automated deployment — using industry-standard tools:

- **Terraform** for Infrastructure as Code (IaC)
- **Ansible** for Configuration Management and Application Deployment
- **Docker** for Containerization
- **GitHub Actions** for CI/CD Automation
- **AWS EC2** as the cloud hosting environment

The deployed application is a **Python Flask portfolio website**, showcasing a secure, scalable, and automated DevOps workflow — fully repeatable from source code.

---

## Objectives

1. **Automate infrastructure provisioning** using Terraform.
2. **Deploy a Dockerized Flask application** using Ansible.
3. **Implement a CI/CD pipeline** that auto-deploys to AWS EC2 via GitHub Actions.
4. **Ensure repeatability, reliability, and scalability** of the deployment process.
5. **Demonstrate practical DevOps integration** aligned with cloud and security best practices.

---

##  Architecture Overview

###  Workflow Summary

```text
Developer Commit → GitHub Repo (main)
       │
       ▼
GitHub Actions Workflow
       │
       ├── Checks out repository
       ├── Installs Ansible + SSH tools
       ├── Connects to EC2 securely via SSH key (GitHub Secrets)
       ├── Executes Ansible playbook:
       │       • Copies Flask app to EC2
       │       • Builds Docker image
       │       • Runs Gunicorn container on port 80
       └── Verifies deployment with smoke test (curl)
FINAL GREEN RUN
