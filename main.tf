# GitLab Runner that runs only tagged jobs
resource "gitlab_runner" "my_runner" {
  registration_token = var.gitlab_runner_registration_token
  description        = var.gitlab_group_description

  run_untagged = "false"
  tag_list     = ["tag_one", "tag_two"]
}

# This creates a configuration for a "kubernetes" runner, but can be changed to generate whatever is needed.
# To use it, we could insert it into our GitLab Runner Helm Chart values.yaml. 
# See https://docs.gitlab.com/runner/configuration/advanced-configuration.html for more information.
resource "local_file" "config" {
  filename = "${path.module}/config.toml"
  content  = <<CONTENT
  concurrent = 1
  [[runners]]
    name = "my_runner"
    url = "https://gitlab.com/"
    token = "${gitlab_runner.my_runner.authentication_token}"
    executor = "kubernetes"
####
# There are countless ways to have our runner nodes just the way we want. 
##
# [[runners.kubernetes.volumes.pvc]]
#       name = "pvc-1"
#       mount_path = "/mnt/dir"
#   [runners.kubernetes.node_selector]
#       app = "gitlab-runner"
#   [[gitlab.kubernetes.node_tolerations]]
#     "karpenter=True" = "NoSchedule"
#   [runners.kubernetes]
#       [runners.kubernetes.affinity]
#         [runners.kubernetes.affinity.node_affinity]
#            [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution]]
#                weight = 100
#             [runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_expressions]]
#                key = "karpenter.k8s.aws/instance-cpu"
#                operator = "In"
#                values = ["16"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_expressions]]
#                key = "karpenter.sh/capacity-type"
#                operator = "In"
#                values = ["spot"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_fields]]
#                key = "kubernetes.io/os"
#                operator = "In"
#                values = ["linux"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_fields]]
#                key = "cpu_type"
#                operator = "In"
#                values = ["arm64"]
#           [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution]]
#             weight = 50
#             [runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_expressions]]
#                key = "karpenter.k8s.aws/instance-cpu"
#                operator = "In"
#                values = ["32"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_expressions]]
#                key = "karpenter.sh/capacity-type"
#                operator = "In"
#                values = ["spot"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_fields]]
#                key = "kubernetes.io/os"
#                operator = "In"
#                values = ["linux"]
#               [[runners.kubernetes.affinity.node_affinity.preferred_during_scheduling_ignored_during_execution.preference.match_fields]]
#                key = "cpu_type"
#                operator = "In"
#                values = ["arm64"]

CONTENT
}
