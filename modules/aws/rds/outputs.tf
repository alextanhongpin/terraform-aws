output "endpoint" {
	value = "${aws_db_instance.rds.endpoint}"
	description = "the endpoint of the rds instance"
}

output "address" {
	value = "${aws_db_instance.rds.address}"
	description = "the address of the rds instance"
}
