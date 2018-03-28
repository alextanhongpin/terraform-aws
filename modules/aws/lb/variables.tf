/*
 * Tags
**/
variable "application" {
	description = "the name of your application, e.g. app"
	type = "string"
}

variable "environment" {
	description = "the environment of your application, e.g. Development"
	type = "string"
}

/*
 * AWS EC2 Load Balancers
**/
variable "name" {
	description = "the name of your load balancer, e.g. app"
	type = "string"
}

variable "subnets" {
	description = "the subnet list to attach to the load balancers, changing this for the network load balancer will force recreation of the resources, e.g. '[\"subnet-xxx\", \"subnet-yyy\"]'"
	type = "list"
}

/*
 * AWS EC2 Target Groups
**/
variable "target_group_name" {
	description = "the name of the target group, e.g. app"
	type = "string"
}

variable "target_group_port" {
	description = "the port of the target group, e.g. 80"
	type = "string"
}

variable "target_group_protocol" {
	description = "the protocol of the target group, e.g. HTTP"
	type = "string"
}

variable "target_group_vpc_id" {
	description = "the vpc id of the target group, e.g. vpc-xxx"
	type = "string"
}

variable "health_check_path" {
	description = "the health check endpoint, e.g. /health"
	type = "string"
}

variable "health_check_port" {
	description = "the health check port, e.g. 80"
	type = "string"
}

variable "health_check_protocol" {
	description = "the health check protocol, e.g. HTTP"
	type = "string"
}

/*
 * AWS API Gateway VPC Link
**/
variable "vpc_link_name" {
	description = "the name of the vpc link, use your application name suffixed with the environment if you are unsure of the naming, e.g. app-dev"
	type = "string"
}

variable "vpc_link_description" {
	description = "the description of your vpc link"
	type = "string"
}

/*
 * AWS EC2 Load Balancer Listener
**/
variable "listener_port" {
	description = "the port of the listener, e.g. 80"
	type = "string"
}

variable "listener_protocol" {
	description = "the protocol of the listener, e.g. TCP"
	type = "string"
}

/*
 * Optionals
**/
variable "region" {
	description = "the AWS region of the application"
	default = "ap-southeast-1"
}

/*
 * AWS EC2 Load Balancers
**/
variable "load_balancer_type" {
	description = "the load balancer type can be network, classic or application, defaults to network"
	default = "network"
}

variable "internal" {
	description = "the load balancer visibility to public, defaults to internal"
	default = true
}

variable "enable_deletion_protection" {
	description = "the load balancer can only be deleted if this is set to false, defaults to true"
	default = true
}

variable "idle_timeout" {
	description = "the time in seconds that the connection is allowed to be idle, defaults to 60 seconds"
	default = 60
}

variable "ip_address_type" {
	description = "the type of IP addresses used by the subnets for your load balancer"
	default = "ipv4"
}

/*
 * AWS EC2 Target Groups
**/
variable "target_group_type" {
	description = "the target group type can be 'instance' of 'ip', defaults to ip for network load balancer"
	default = "ip"
}
