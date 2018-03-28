output "cache_nodes" {
	description = "List of node objects including id, address, port and availability_zone"
	value = "${aws_elasticache_cluster.elasticache.cache_nodes}"
}