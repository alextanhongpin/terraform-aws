/*
 * AWS RDS
 *
 * Creates a new Redis cluster.
**/
resource "aws_elasticache_cluster" "elasticache" {
	cluster_id = "${var.cluster_id}"
	
	node_type = "${var.node_type}"
	num_cache_nodes = "${var.num_cache_nodes}"
	
	engine = "${var.engine}"
	engine_version = "${lookup(var.engine_version, var.engine)}"
	parameter_group_name = "${lookup(var.parameter_group_name, var.engine)}"
	port = "${lookup(var.port, var.engine)}"
	
	subnet_group_name = "${var.subnet_group_name}"
	security_group_ids = "${var.security_group_ids}"
	availability_zone = "${var.availability_zone}"

	tags {
		Application = "${var.application}"
		Environment = "${var.environment}"
	}
}
