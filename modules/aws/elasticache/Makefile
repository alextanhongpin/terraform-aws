init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars

import:
	terraform import -var-file=main.tfvars aws_elasticache_cluster.app app

graph:
	terraform graph | dot -Tpng > graph.png