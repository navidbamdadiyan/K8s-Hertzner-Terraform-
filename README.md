# K8s-Hertzner-Terraform-
terraform init
terraform apply
cp -rfp inventory/sample inventory/hetzner
ansible-playbook -i inventory/hetzner/inventory.ini \
  -u root --become --become-user=root \
  cluster.yml
