output "repository_url" {
  description = "The URL of the created GitHub repository"
  value       = github_repository.my_repo.html_url
}
