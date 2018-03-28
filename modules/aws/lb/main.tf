/*
 * AWS EC2 Load Balancers
 *
 * Creates a Network Load Balancer.
**/
resource "aws_lb" "app" {
	name = "${var.name}"
	load_balancer_type = "${var.load_balancer_type}"

	internal = "${var.internal}"
	enable_deletion_protection = "${var.enable_deletion_protection}"
	idle_timeout = "${var.idle_timeout}"

	subnets = "${var.subnets}"
	ip_address_type = "${var.ip_address_type}"
	
	tags {
		Application = "${var.application}"
		Environment = "${var.environment}"
	}
}

/*
 * AWS EC2 Target Groups
 *
 * Create a new target group that the load balancer is pointing to.
**/
resource "aws_lb_target_group" "app" {
	name = "${var.target_group_name}"
	port = "${var.target_group_port}"
	protocol = "${var.target_group_protocol}"

	vpc_id = "${var.target_group_vpc_id}"
	target_type = "${var.target_group_type}"

	health_check {
		path = "${var.health_check_path}"
		port = "${var.health_check_port}"
		protocol = "${var.health_check_protocol}"
	}

	tags {
		Application = "${var.application}"
		Environment = "${var.environment}"
	}
}

output "target_group_arn" {
	value = "${aws_lb_target_group.app.arn}"
}
/*
 * AWS API Gateway VPC Link
 *
 * Creates a VPC Link in the Amazon API Gateway that targets a specific NLB
**/
resource "aws_api_gateway_vpc_link" "app" {
  name = "${var.vpc_link_name}"
  description = "${var.vpc_link_description}"
  target_arns = ["${aws_lb.app.arn}"]
}

/*
 * AWS EC2 Load Balancer Listener
 *
 * Creates a listener that links to Load Balancer to the Target Groups
**/
resource "aws_lb_listener" "app" {
	load_balancer_arn = "${aws_lb.app.arn}"
	port = "${var.listener_port}"
	protocol = "${var.listener_protocol}"
	
	default_action {
		target_group_arn = "${aws_lb_target_group.app.arn}"
		type = "forward"
	}
}