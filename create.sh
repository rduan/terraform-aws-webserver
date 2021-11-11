echo "terraform init ..."
docker run --rm -it --name terraform -v $(pwd):/workspace -w /workspace hashicorp/terraform:1.0.10 init && \
echo
echo "terraform validate ..."
docker run --rm -it --name terraform -v $(pwd):/workspace -w /workspace hashicorp/terraform:1.0.10 validate && \
echo
echo "terraform plan ..."
docker run --env-file awsenv --rm -it --name terraform -v $(pwd):/workspace -w /workspace hashicorp/terraform:1.0.10 plan -out=o8t-plan.tfstate && \
echo
echo "terraform apply ..."
docker run --env-file awsenv --rm -it --name terraform -v $(pwd):/workspace -w /workspace hashicorp/terraform:1.0.10 apply o8t-plan.tfstate
