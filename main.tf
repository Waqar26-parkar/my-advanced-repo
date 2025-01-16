

provider "github" {
  token = var.github_token
  owner = "Waqar26-parkar" # Use your personal account name here
}

resource "github_repository" "new_repo" {
  name        = "new-githubcicd-repository"
  description = "A new repository created by Terraform"
  visibility  = "public"
}
