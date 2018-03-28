init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars

graph:
	# If you hit the error: /bin/sh: dot: command not found, install graphviz
	# brew install graphviz
	terraform graph | dot -Tpng > graph.png

import:
	terraform import -var-file=main.tfvars aws_ecs_cluster.app app