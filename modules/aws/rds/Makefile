init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars

import:
	terraform import -var-file=main.tfvars aws_db_instance.app app


graph:
	# If you hit the error: /bin/sh: dot: command not found, install graphviz
	# brew install graphviz
	terraform graph | dot -Tpng > graph.png