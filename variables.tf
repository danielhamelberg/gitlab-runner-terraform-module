variable "gitlab_url" {
  description = "The URL of the GitLab instance"
  default     = "https://gitlab.com/"
}

variable "gitlab_token" {
  description = "The token for the GitLab instance"
}

variable "gitlab_group_name" {
  description = "The name of the GitLab group"
}

variable "gitlab_group_description" {
  description = "The description of the GitLab group"
}
