provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "ap-southeast-1"
}


locals {
	application = "app"
	environment = "Staging"
	name = "app-stage"
	availability_zone = "ap-southeast-1a"
	subnets = ["subnet-xxx", "subnet-yyy"]
	security_groups = ["sg-xxx", "sg-yyy"]
	target_group_vpc_id = "vpc-xxx"
}

module "lb" {
	source = "../../modules/aws/lb"
	version = "0.0.1"

	name = "${local.name}"
	subnets = "${local.subnets}"
	load_balancer_type = "network"

	# Load balancer target group
	target_group_name = "${local.name}"
	target_group_port = 80
	target_group_protocol = "TCP"
	target_group_vpc_id = "${locals.target_group_vpc_id}"
	target_group_type = "ip"

	health_check_path = "/.well-known/openid-configuration"
	health_check_port = 80
	health_check_protocol = "HTTP"

	# API Gateway VPC Link
	vpc_link_name = "${local.name}"
	vpc_link_description = "VPC Link that connects the Network Load Balancer that is targetting the Target Group running Identity Server 4 in ECS"

	listener_port = 80
	listener_protocol = "TCP"
}

module "api_gateway" {
	source = "../../modules/aws/api-gateway"
	version = "0.0.1"

	name = "${local.name}"
	description = "Auth Service Gateway for Identity Server 4"
	path_part = "common"
}

# NOTE: The current terraform does not provide any easy means to create the ECS cluster,
# hence this needs to be created manually with the correct name and VPC. Comment this part
# and run the creation of lb (load balancer) and Api Gateway first before proceeding with this.
module "ecs" {
	source = "../../modules/aws/ecs"
	version = "0.0.1"

	# Needs to be created with the following name
	cluster_name = "${local.name}"
	repository= "organization/app"

	family = "app"
	name = "app"

	# Needs to be created manually
	target_group_arn = "${module.lb.target_group_arn}"
	container_name = "idp"
	container_port = "80"
	subnets = "${local.subnets}"
	security_groups = "${local.security_groups}"
}