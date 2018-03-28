get:
	terraform get

init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars

install-graph:
	brew install graphviz

graph:
	terraform graph | dot -Tpng > graph.png
	# terraform graph -module-depth=0 | dot -Tpng > graph.png