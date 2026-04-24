# AWS Static Website Hosting Project

## Project Motivation

After completing my initial AWS and Azure certifications, I wanted to move beyond theory and start building practical cloud projects.

This project is my cloud version of a “Hello World”: a static website hosted on Amazon S3, with the possibility of adding Amazon CloudFront later for HTTPS, caching, and a more production-like architecture.

The goal is not only to publish a simple website, but to understand the foundations behind static website hosting in the cloud, including storage, permissions, public access, deployment, infrastructure automation, and cost control.

## Documentation

All project steps, decisions, errors, fixes, and technical learnings will be documented in the `docs/` folder.

The purpose of this documentation is to keep a clear record of the project evolution, from the first manual deployment using the AWS Console to future improvements such as Terraform automation, CloudFront, HTTPS, and CI/CD.

The `docs/` folder will include notes about:

- Manual S3 deployment
- Static website hosting configuration
- Bucket permissions and public access decisions
- Error handling and troubleshooting
- Terraform implementation
- CI/CD pipeline implementation
- Security considerations
- Cost control decisions
- Future improvements

This documentation will help explain not only what was built, but also why each technical decision was made.

## Project Overview

This project consists of a static website built with HTML, CSS, and images, hosted on AWS using Amazon S3.

The first stage of the project is a manual deployment using the AWS Management Console. After that, the infrastructure will be recreated using Terraform to automate the environment provisioning.

A future improvement may include a CI/CD pipeline to automate deployments from GitHub to S3.

## Architecture

### Initial Architecture

```text
User
  ↓
S3 Static Website Endpoint
  ↓
HTML / CSS / Images