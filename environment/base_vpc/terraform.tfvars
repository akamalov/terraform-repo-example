terragrunt {
  # Include any .terragrunt files in parent folders
  include = {
    path = "${find_in_parent_folders()}"
  }
}
