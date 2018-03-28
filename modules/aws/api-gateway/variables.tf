/*
 * Required
**/

variable "access_key" {}
variable "secret_key" {}

variable "name" {
	description = "the name of your api, e.g. app"
	type = "string"
}

variable "description" {
	description = "the description of your api, e.g. authentication service running Identity Server 4"
	type = "string"
}

variable "path_part" {
	description = "the resource path name of your api, e.g. /auth"
	type = "string"
}

/*
 * Optionals
**/

variable "region" {
	description = "the aws region where your application is hosted"
	default = "ap-southeast-1"
}