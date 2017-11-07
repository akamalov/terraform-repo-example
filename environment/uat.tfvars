#---------------
# Core Settings
#---------------
environment = "uat"

#--------------
# Networking
#--------------
# The first two octets of the VPC to create.
vpc_cidr_block_prefix = "10.2"

#----
# Security
#----
sshkey_root_private_file = "secrets/sshkey_root_uat.pem"

#----
# ECS cluster
#----
ecs_cluster_max_size = "5"

ecs_cluster_desired_size = "3"

ecs_cluster_instance_type = "t2.small"

docker_hub_user_file = "secret/docker_hub_user.txt"

docker_hub_password_file = "secret/docker_hub_password.txt"

docker_hub_email_file = "secret/docker_hub_email.txt"

ecs_ssh_allowed_cidr_blocks = ["0.0.0.0/0"]

#----
# Load Balancer
#----
alb_internal_http_allowed_cidr_blocks = ["0.0.0.0/0"]

alb_internal_https_allowed_cidr_blocks = ["0.0.0.0/0"]

alb_certificate_body_file = "secret/my_cert_uat.pem"

alb_certificate_private_key_file = "secret/my_private_key_uat.key"

alb_certificate_chain_file = "secret/my_cert_chain_uat.pem"
