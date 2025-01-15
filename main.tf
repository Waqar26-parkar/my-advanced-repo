provider "github" {
  token = var.github_token  # GitHub token is loaded from environment variable
  owner = var.github_owner  # GitHub repository owner (GitHub username)
}

resource "github_repository" "my_repo" {
  name        = "mycicd-terraform-repo"        # Name of the GitHub repository
  description = "GitHub repository created using Terraform"
  visibility  = "public"                   # Set to "private" if you want a private repo
  auto_init   = true                       # Initialize the repository with a README
}

resource "github_repository_collaborator" "collaborator" {
  repository = github_repository.my_repo.name
  username   = var.collaborator_username  # GitHub collaborator username
  permission = "push"                      # Give push permissions to the collaborator
}
