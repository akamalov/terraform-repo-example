terragrunt {
  # Configure Terragrunt to automatically store tfstate files in S3
  remote_state {
    backend = "s3"

    config {
      encrypt    = true
      bucket     = "${get_aws_account_id()}-terraform-state"
      key        = "${get_env("TF_VAR_environment", "")}/${path_relative_to_include()}/state.tfstate"
      region     = "${get_env("AWS_DEFAULT_REGION", "")}"
      lock_table = "terraform-locks-${get_env("TF_VAR_environment", "")}"
    }
  }

  # Configure Terragrunt to automatically add the appropriate
  # .tfvars file for the environment
  terraform {
    extra_arguments "environment_vars" {
      arguments = [
        "-var-file=./../${get_env("TF_VAR_environment", "")}.tfvars",
      ]

      commands = ["${get_terraform_commands_that_need_vars()}"]
    }
  }
}
