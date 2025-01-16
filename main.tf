provider "github" {
  token = var.github_token  # This token will be passed from GitHub Actions as an environment variable
  owner = "Waqar26-parkar"   # Replace with your GitHub username or organization
}

resource "github_repository" "new_repo" {
  name        = "new-githubcicd-repository"
  description = "A new repository created by Terraform"
  visibility  = "public"  # You can change this to "private" if you want
}

resource "github_team" "new_team" {
  name        = "dev-team"
  description = "Development Team"
}


