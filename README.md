# gitlab-runner-terraform-module
Outlines how to manage GitLab Runners in a Terraform module

# GitLab Runner Terraform Module ##


- main.tf
- variables.tf
- datasources.tf
- provider.tf
- terraform.tfvars


## Argument Reference

The following arguments are supported in resource "gitlab_runner".

* `registration_token` - (Required) The registration token for the GitLab instance.
* `description` - (Optional) The description of the runner.
* `tag_list` - (Optional) A list of tags for the runner.
* `run_untagged` - (Optional) Whether the runner should run untagged jobs.
* `locked` - (Optional) Whether the runner is locked.
* `access_level` - (Optional) The access level of the runner.
* `maximum_timeout` - (Optional) The maximum timeout for the runner.
* `active` - (Optional) Whether the runner is active.
* `maximum_timeout` - (Optional) The maximum timeout for the runner.
* `authentication_token` - (Optional) The authentication token for the runner.

## Attributes Reference

The following attributes are exported:

* `id` - The ID of the runner.
* `name` - The name of the runner.
* `description` - The description of the runner.
* `tag_list` - The list of tags for the runner.
* `run_untagged` - Whether the runner should run untagged jobs.
* `locked` - Whether the runner is locked.
* `access_level` - The access level of the runner.
* `maximum_timeout` - The maximum timeout for the runner.
* `active` - Whether the runner is active.
* `maximum_timeout` - The maximum timeout for the runner.
* `authentication_token` - The authentication token for the runner.

## Import

Runners can also be imported using the `id`, e.g.

```
$ terraform import gitlab_runner.my_runner 12345
```

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
