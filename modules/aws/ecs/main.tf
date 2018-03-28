/*
 * AWS EC2
 *
 * Create an instance for hosting the ECS cluster.
 * NOTE: Find a way to link it back to the ECS cluster,
 * with autoscaling group.
**/
// resource "aws_instance" "app" {
// 	ami = "ami-0a622c76"
// 	availability_zone = "ap-southeast-1a"
// 	instance_type = "t2.medium"
// 	vpc_security_group_ids = [""]
// 	subnet_id = ""
// 	iam_instance_profile = "ecsInstanceRole"
// 	monitoring = true
// 	tags {
// 		Application = "app"
// 		Environment = "Development"
// 	}
// }

/*
 * AWS ECR
 *
 * Create a new repository with the given name
**/
resource "aws_ecr_repository" "app" {
	name = "${var.repository}"
}

/*
 * AWS ECS Cluster
 *
 * Create an empty cluster. The current Terraform version does
 * not support creating a cluster with the ECS Instance, hence this needs to
 * be created manually at the time being.
**/
// resource "aws_ecs_cluster" "app" {
// 	name = "app"
// }

/*
 * AWS ECS Cluster
 *
 * Get the data of the ECS Cluster that is created manually due to the limitation 
 * mentioned above.
**/
data "aws_ecs_cluster" "app" {
	cluster_name = "${var.cluster_name}"
}

/*
 * AWS ECS Task Definition
 *
 * Create a new task definition with the docker configuration specified in
 * the json file.
**/
resource "aws_ecs_task_definition" "app" {
	family = "${var.family}"
	cpu = "${var.cpu}"
	memory = "${var.memory}"
	network_mode = "${var.network_mode}"

	container_definitions = "${file("task-definitions/your-task-definition.json")}"
}

/*
 * AWS ECS Service
 *
 * Create a new service which will run the task definition with the desired
 * number of instances.
**/
resource "aws_ecs_service" "app" {
	name = "${var.name}"
	cluster = "${data.aws_ecs_cluster.app.id}"
	task_definition = "${aws_ecs_task_definition.app.arn}"
	desired_count = "${var.desired_count}"
	deployment_minimum_healthy_percent = "${var.deployment_minimum_healthy_percent}"

	placement_strategy {
		type = "spread"
		field = "instanceId"
	}

	placement_strategy {
		type = "spread"
		field = "attribute:ecs.availability-zone"
	}

	load_balancer {
		target_group_arn = "${var.target_group_arn}"
		container_name = "${var.container_name}"
		container_port = "${var.container_port}"
	}

	network_configuration {
		subnets = "${var.subnets}"
		security_groups = "${var.security_groups}"
	}
}