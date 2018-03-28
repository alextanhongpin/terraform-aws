/*
 * AWS RDS
 *
 * Creates a new storage instance.
**/
resource "aws_db_instance" "rds" {
	identifier = "${var.identifier}"
	
	username = "${var.username}"
	password = "${var.password}"
	
	engine = "${var.engine}"
	engine_version = "${lookup(var.engine_version, var.engine)}"
	port = "${lookup(var.port, var.engine)}"
	
	instance_class = "${var.instance_class}"

	allocated_storage = "${var.allocated_storage}"
	storage_type = "${var.storage_type}"

	license_model = "${var.license_model}"
	final_snapshot_identifier = "${var.final_snapshot_identifier}"

	vpc_security_group_ids = "${var.vpc_security_group_ids}"
	db_subnet_group_name = "${var.db_subnet_group_name}"
	availability_zone = "${var.availability_zone}"
	parameter_group_name = "${lookup(var.parameter_group_name, var.engine)}"	

	tags {
		Application = "${var.application}"
		Environment = "${var.environment}"
	}
}