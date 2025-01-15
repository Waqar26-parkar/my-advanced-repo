# main.tf

provider "github" {
  token = var.github_token
  owner = var.github_owner  # Your GitHub username or organization name
}

# Create the GitHub repository
resource "github_repository" "my_advanced_repo" {
  name        = "my-advanced-repo"
  description = "A GitHub repository created using Terraform with CI/CD pipeline"
  visibility  = "public"
  has_issues  = true
  has_wiki    = false
}

# Create the 'develop' branch in the repository
resource "github_branch" "develop" {
  repository = github_repository.my_advanced_repo.name
  branch     = "develop"
}

# Add a GitHub Actions workflow file
resource "local_file" "workflow_file" {
  content = <<EOF
name: CI/CD Pipeline

on:
  push:
    branches:
      - main
      - develop

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - name: Checkout code
      uses: actions/checkout@v2
    - name: Set up Python
      uses: actions/setup-python@v2
      with:
        python-version: 3.8
    - name: Install dependencies
      run: |
        python -m pip install --upgrade pip
        pip install -r requirements.txt
    - name: Run tests
      run: |
        pytest tests/
EOF

  filename = "./.github/workflows/ci_cd_pipeline.yml"
}

# Add a collaborator to the repository
resource "github_repository_collaborator" "collaborator" {
  repository = github_repository.my_advanced_repo.name
  username   = var.collaborator_username
  permission = "push"  # "pull", "push", or "admin"
}

# Create issues in the repository
resource "github_issue" "issue1" {
  title       = "Bug: Application crashes on startup"
  body        = "The application crashes when starting up with error XYZ."
  repository  = github_repository.my_advanced_repo.name
}

resource "github_issue" "issue2" {
  title       = "Feature request: Add dark mode"
  body        = "Please add a dark mode option for the application."
  repository  = github_repository.my_advanced_repo.name
}
