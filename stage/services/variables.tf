variable "subnets" {
	type = "list"
	description = "the subnet group, e.g. [\"subnet-xxx\", \"subnet-yyy\"]"
}

variable "security_groups" {
	type = "list"
	description = "the target security group, e.g. [\"sg-xxx\", \"sg-yyy\"]"
}

variable "target_group_vpc_id" {
	type = "string"
	description = "the target group vpc id, e.g. vpc-xxx"
}
