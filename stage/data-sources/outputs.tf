output "rds_endpoint" {
	value = "${module.rds.endpoint}"
}

output "rds_address" {
	value = "${module.rds.address}"
}

output "elasticache_cache_nodes" {
	value = "${module.elasticache.cache_nodes}"
}
