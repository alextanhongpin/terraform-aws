init:
	terraform init

plan:
	terraform plan -var-file=main.tfvars -out=plan

apply:
	terraform apply plan

destroy:
	terraform destroy -var-file=main.tfvars
