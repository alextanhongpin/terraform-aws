// Required
variable "access_key" {}
variable "secret_key" {}

variable "bucket" {
	description = "the name of the bucket"
	type = "string"
}

// Optionals
variable "region" {
	description = "the region where the application is hosted"
	default = "ap-southeast-1"
}

variable "application" {
	description = "the name of the application you are running"
	default = "app"
}

variable "environment" {
	description = "the development environment, e.g. Production, Staging, Development, Testing"
	default = "Development"
}

variable "acl" {
	description = "the ACL should be private by default"
	default = "private"
}

variable "versioning_enabled" {
	description = "whether to enable versioning on the S3 bucket"
	default = true
}