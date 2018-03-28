# Terraform Starter

- [x] Create a single AWS instance
- [ ] Link two instances together
- [ ] Make variables
- [ ] Make outputs
- [ ] Store the data in s3
- [ ] Create modules


## Generic Makefile

```Makefile
init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=main

apply:
	terraform apply -var-file=main.tfvars

destroy:
	terraform destroy -var-file=main.tfvars

# import:
# 	terraform import [specific instance...]

graph:
	# If you hit the error: /bin/sh: dot: command not found, install graphviz
	# brew install graphviz
	terraform graph | dot -Tpng > graph.png
```

## TIPS

### Specify the current version 

Always specify the current version in used so that users are aware of it.

```
terraform {
  required_version = "> 0.7.0"
}
```


### Define variable type for required variables

```hcl
# Good
variable "load_balancer_type" {
	type = "string"
}

# Redundant
variable "idle_timeout" {
	type = "string"
	default = 60
}

# Redundant
variable "internal" {
	type = "string"
	default = true
}
```

### Split variables to optional and required section

```
# Required
variable "a" {
	type = "string"
}

variable "b" {
	type = "list"
}

# Optional
variable "c" {
	default = true
}

variable "d" {
	default = 10
}
```

## Storing to S3 backend

Unfortunately, when you change the access key or secret, the old state cannot be accessed anymore.

```hcl
/*
 * AWS S3
 *
 * Stores the Terraform state of the resources that has been created in the S3 backend.
**/
 terraform {
 	required_version = ">= 0.11.2"

 	backend "s3" {
 		bucket = "YOUR_BUCKET_NAME"
 		key = "YOUR_FILE_NAME"
 		region = "ap-southeast-1"
 		encrypt = true
 	}
 }
```