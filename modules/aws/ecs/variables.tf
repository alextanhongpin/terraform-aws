/*
 * Required
**/

variable "access_key" {}
variable "secret_key" {}

/*
 * AWS ECR
**/
variable "repository" {
	description = "the name of the ECR repository, e.g. auth-service"
	type = "string"
}

/*
 * AWS ECS Cluster
**/
variable "cluster_name" {
	description = "the name of the ECS cluster, e.g. auth-cluster"
	type = "string"
}

/*
 * AWS ECS Task Definition
**/
variable "family" {
	description = "the family in which the services belong to, e.g. auth-task"
	type = "string"
}

variable "network_mode" {
	description = "the network mode defaults to awsvpc, other options available are listed in the official documentation"
	default = "awsvpc"
}

/*
 * AWS ECS Service
**/
variable "name" {
	description = "the name of the service, e.g. auth-service"
	type = "string"
}

variable "desired_count" {
	description = "the desired count of the instances, defaults to a minimum of 1"
	default = 1
}

variable "target_group_arn" {
	description = "the target group that the load balancer is targetting, can be found in the EC2 > Load Balancing > Target Group section"
	type = "string"
}

variable "container_name" {
	default = "the name of the container or the aws_ecs_service name, e.g. auth-service"
	type = "string"
}

variable "container_port" {
	default = "the port running in the container, e.g. 80"
	type = "string"
}

variable "subnets" {
	description = "the list of subnets, e.g. '[\"subnet-xxx\", \"subnet-yyy\"]'"
	type = "list"
}

variable "security_groups" {
	description = "the list of security-groups, e.g. '[\"sg-xxx\", \"sg-yyy\"]'"
	type = "list"
}

/*
 * Optionals
**/

variable "region" {
	default = "ap-southeast-1"
}

/*
 * AWS ECS Task Definition
**/
variable "memory" {
	description = "the memory allocated in MB"
	default = 128
}

variable "cpu" {
	description = "the cpu size"
	default = 512
}

/*
 * AWS ECS Service
**/
variable "deployment_minimum_healthy_percent" {
	description = "the minimum health before the instance is being removed from the cluster"
	default = 50
}
