variable "access_key" {
	description = "the aws access key that has the IAM policy to spin up both RDS and Elasticache"
}

variable "secret_key" {
	description = "the aws secret key that has the IAM policy to spin up both RDS and Elasticache"
}

variable "password" {
	description = "the database password"
}

variable "vpc_security_group_ids" {
	type = "list"
	description = "the vpc security group id, e.g. [\"sg-xxx\", \"sg-yyy\"]"
}

variable "db_subnet_group_name" {
	type = "list"
	description = "the db subnet group name, e.g. default-vpc-xxx"
}

variable "security_group_ids" {
	type = "list"
	description = "the vpc security groups id, e.g. [\"sg-xxx\"]"
}
