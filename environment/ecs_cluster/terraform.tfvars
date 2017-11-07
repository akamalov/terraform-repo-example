terragrunt = {
  # Include any .terragrunt files in parent folders
  include = {
    path = "${find_in_parent_folders()}"
  }

  # Set any other components that this depends on
  dependencies = {
    paths = ["../base_vpc"]
  }
}
