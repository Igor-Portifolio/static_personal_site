variable "aws_region" {
  description = "AWS region used by the AWS provider."
  type        = string
  default     = "eu-west-3"
}

variable "project_name" {
  description = "Project name used for tags and resource naming."
  type        = string
  default     = "cloud-static-website"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Globally unique name for the private S3 bucket."
  type        = string
  
  default = "cloud-static-website-terraform-dev-igor-machado-2026"
}

variable "static_site_prefix" {
  description = "S3 prefix where the static website files will be stored."
  type        = string
  default     = "static_site"
}

variable "force_destroy_bucket" {
  description = "If true, Terraform can delete the bucket even when it contains objects. Use carefully."
  type        = bool
  default     = true
}