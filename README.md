# terraform-repo-example

This is an example of how I structure my Terraform projects. It should build a base VPC in AWS, a load balancer and an ECS cluster.

In order to run you just need terragrunt, and to set an environment variable "environment" to either uat or prod, then run "terragrunt apply" in whatever folder you want, or "terragrunt apply-all" from the root environment folder.

The idea behind this structure is to use the "environment" directory for the definitions of how an environment actually looks. The modules are re-usable building blocks. I use an environment variable to determine which environment I'm running in so that all environments use the exact same terraform code, just with different variables which are defined in the uat.tfvars or prod.tfvars files.

The example_service directory contains an example of the terraform code a developer would keep in their app's repo and use as part of the deployment pipeline for the app. They just set up the environment variables AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_DEFAULT_REGION, TF_VAR_environment, TF_VAR_service_name, TF_VAR_image_tag and TF_VAR_build_version and then run terragrunt apply. Obviously different apps will need customisation of the taskdefinition and some of the other terraform code for appropriate ports etc.
