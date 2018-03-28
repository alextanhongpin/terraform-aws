provider "aws" {
	access_key = "${var.access_key}"
	secret_key = "${var.secret_key}"
	region = "ap-southeast-1"
}

locals {
	name = "app-stage"

	application = "app"
	environment = "Staging"

	availability_zone = "ap-southeast-1a"
}

module "rds" {
	source = "../../modules/aws/rds"
	version = "0.0.1"

	identifier = "${local.name}"

	username = "admin"
	password = "${var.password}"

	availability_zone = "${local.availability_zone}"
	vpc_security_group_ids = "${var.vpc_security_group_ids}"
	db_subnet_group_name = "${var.db_subnet_group_name}"
	
	# Tags
	application = "${local.application}"
	environment = "${local.environment}"
}

module "elasticache" {
	source = "../../modules/aws/elasticache"
	version = "0.0.1"

	cluster_id = "${local.name}"
	num_cache_nodes = 1
	engine = "redis"
	subnet_group_name = "prod-private"
	security_group_ids = "${var.security_group_ids}"
	availability_zone = "${local.availability_zone}"

	# Tags
	application = "${local.application}"
	environment = "${local.environment}"
}
