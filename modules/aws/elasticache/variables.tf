/*
 * Required
**/

// variable "access_key" {}
// variable "secret_key" {}

variable "cluster_id" {
	description = "the name of your cluster, e.g. app"
	type = "string"
}

variable "subnet_group_name" {
	description = "the name of the allowed subnet, e.g. subnet-xxx"
	type = "string"
}

variable "security_group_ids" {
	description = "the list of the allowed security groups, e.g. sg-xxx"
	type = "list"
}

variable "availability_zone" {
	description = "the availability zone, e.g. ap-southeast-1b"
	type = "string"
}

variable "application" {
	description = "the application name, e.g. app-dev"
	type = "string"
}

variable "environment" {
	description = "the application environment, e.g. Development"
	type = "string"
}

/*
 * Optionals
**/

variable "region" {
	description = "the AWS region of the application"
	default = "ap-southeast-1"
}

variable "port" {
	description = "the port of the data store, lookup available for redis only"
	type = "map"
	default {
		redis = 6379
	}
}

variable "node_type" {
	description = "the instance size of the redis application, defaults to the smallest instance"
	default = "cache.t2.micro"
}

variable "num_cache_nodes" {
	description = "the number of cache nodes, defaults to 1"
	default = 1
}

variable "engine" {
	description = "the cache engine can be either redis or memcached, defaults to redis"
	default = "redis"
}

variable "engine_version" {
	description = "the version of the cache engine, lookup available for redis only" 
	type = "map"
	default {
		redis = "3.2.4"
	}
}

variable "parameter_group_name" {
	description = "the parameter group name, lookup available for redis only"
	type = "map"
	default {
		redis = "default.redis3.2"
	}
}