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

## Paths Taken and Security Decisions

### Endpoint in S3

In the first version of the project, the static website was hosted directly on Amazon S3 using the S3 Static Website Endpoint. As part of the security demonstration, a text file named mysecrets.txt was added to the website bucket to simulate sensitive information.

This file does not contain real secrets. Its purpose is to demonstrate the risk of placing sensitive or internal files inside a public S3 bucket.

In this initial architecture, the website was served through the S3 website endpoint over HTTP. This means the communication did not use HTTPS/TLS encryption. Also, because the bucket needed public read access to serve the website, any object covered by the public bucket policy could potentially be accessed directly through its URL.

As a result, if a file such as mysecrets.txt were accidentally uploaded to the public bucket, it could be exposed to anyone who knew or discovered the object path. This helped identify a key security limitation of the first approach: using a public S3 bucket as the website endpoint increases the risk of accidental exposure of files that should not be public.

### Cloud Front

The solution to the first security limitation was to introduce Amazon CloudFront in front of the S3 bucket.

Instead of exposing the entire S3 bucket publicly, CloudFront was configured as the public entry point of the application. The CloudFront origin points only to a specific folder inside the S3 bucket, named static_site/, where the public website files are stored.

With this approach, users do not access the S3 bucket directly. They access the website through CloudFront, while the S3 bucket remains private. This reduces the risk of exposing sensitive files, because CloudFront is only allowed to retrieve objects from the static_site/ path.

In addition, this architecture improves the security of the communication layer. CloudFront allows the website to be served over HTTPS, using TLS encryption. This provides a more secure protocol than the original S3 Static Website Endpoint over HTTP, adding confidentiality, integrity, and server authentication to the connection.

Overall, this change improved the architecture by separating public website content from private files, reducing accidental exposure risks, and adding a stronger security layer through HTTPS and controlled access to the S3 origin.