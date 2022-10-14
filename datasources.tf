data "gitlab_group" "my_custom_group" {
  name        = "${var.gitlab_group_name}"
  description = "${var.gitlab_group_description}"
}
