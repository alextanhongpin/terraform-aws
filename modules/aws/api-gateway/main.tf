
/*
 * AWS API Gateway
 *
 * Create a new API group in the AWS API Gateway.
**/
resource "aws_api_gateway_rest_api" "app" {
	name = "${var.name}"
	description = "${var.description}"
}

/*
 * AWS API Gateway
 * 
 * Create a new resource under the API group with the defined resource path.
**/
resource "aws_api_gateway_resource" "app" {
	rest_api_id = "${aws_api_gateway_rest_api.app.id}"
	parent_id = "${aws_api_gateway_rest_api.app.root_resource_id}"
	path_part = "${var.path_part}"
}

/*
 * AWS API Gateway
 * 
 * Create a new GET method under the defined resource.
 * NOTE: Unable to create a path with {proxy+} at the moment. Potential solution here:
 * https://stackoverflow.com/questions/39040739/in-terraform-how-do-you-specify-an-api-gateway-endpoint-with-a-variable-in-the
**/
// resource "aws_api_gateway_method" "app" {
// 	rest_api_id = "${aws_api_gateway_rest_api.app.id}"
// 	resource_id = "${aws_api_gateway_resource.app.id}"
// 	http_method = "GET"
// 	authorization = "NONE"
// }

/*
 * AWS API Gateway
 * 
 * Create a new integration that utilizes VPC_LINK
 * NOTE: VPC_LINK option is not available in the current terraform version
**/
// resource "aws_api_gateway_integration" "app" {
// 	rest_api_id = "${aws_api_gateway_rest_api.app.id}"
// 	resource_id = "${aws_api_gateway_resource.app.id}"
// 	http_method = "GET"
// 	type = "VPC_LINK"
// 	uri = ""
// }
