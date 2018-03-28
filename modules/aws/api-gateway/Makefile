init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars

import:
	@echo Import is not available for "aws_api_gateway_rest_api" and "aws_api_gateway_resource"

graph:
	terraform graph | dot -Tpng > graph.png