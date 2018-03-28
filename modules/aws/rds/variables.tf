/*
 * Required
**/

// variable "access_key" {}
// variable "secret_key" {}

variable "username" {
	description = "the username for your storage, e.g. admin"
	type = "string"
}

variable "password" {
	description = "the password for your storage, e.g. xxx"
	type = "string"
}

variable "identifier" {
	description = "the name of your storage instance, use your application name with environment suffix if you are unsure, e.g. app-stage"
	type = "string"
}

variable "vpc_security_group_ids" {
	description = "the list of vpc security groups to attach, e.g. [\"sg-xxx\", \"sg-yyy\"]"
	type = "list"
}

variable "db_subnet_group_name" {
	description = "the subnet group to attach to the instance, e.g. subnet-xxx"
	type = "string"
}

variable "application" {
	description = "the name of your application, e.g. app-stage"
	type = "string"
}

variable "environment" {
	description = "the environment of your application, e.g. Development"
	type = "string"
}

/*
 * Optional
**/
variable "region" {
	description = "the region where your application resides"
	default = "ap-southeast-1"
}

variable "instance_class" {
	description = "the instance type, defaults to the smallest instance"
	default = "db.t2.micro"
}

variable "allocated_storage" {
	description = "the storage size in GB"
	default = 20
}

variable "storage_type" {
	description = "the storage type"
	default = "standard"
}

variable "storage_encrypted" {
	description = "if true encrypt the storage"
	default = true
}

variable "license_model" {
	default = "license-included"
}

variable "final_snapshot_identifier" {
	default = "final-snapshot"
}

variable "engine" {
	type = "string"
	default = "sqlserver-ex"
}

variable "engine_version" {
	type = "map"
	
	default = {
		sqlserver-ex = "13.00.4451.0.v1"
	}
}

variable "port" {
	type = "map"

	default = {
		sqlserver-ex = "1433"
	}
}

variable "parameter_group_name" {
	type = "map"

	default = {
		sqlserver-ex = "default.sqlserver-ex-13.0"
	}
}

variable "availability_zone" {
	default = "ap-southeast-1b"
}