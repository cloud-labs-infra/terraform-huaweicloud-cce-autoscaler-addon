##
# Common variables
##
variable "region" {
  description = "Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used"
  type        = string
}

variable "cluster_id" {
  description = "Specifies the CCE cluster ID"
  type        = string
}

##
# Add-on Autoscaler Basic
##
variable "addon_version" {
  description = "Version of Autoscaler addon"
  type        = string
  default     = "1.25.46"
}

variable "platform" {
  description = "Platform"
  type        = string
  default     = "linux-amd64"
}

variable "rbac_enabled" {
  description = "Kubernetes rbac enabled"
  type        = bool
  default     = true
}

variable "swr_addr" {
  description = "SWR Address"
  type        = string
  default     = null
}

variable "swr_user" {
  description = "SWR User name"
  type        = string
  default     = "hwofficial"
}

##
# Add-on Autoscaler Custom
##
variable "cores_total" {
  description = "Total number of cores"
  type        = number
  default     = 64
}

variable "memory_total" {
  description = "Memory total"
  type        = number
  default     = 128
}

variable "local_volume_node_scaling_enabled" {
  description = "Local volume node scaling enabled"
  type        = bool
  default     = false
}

variable "log_level" {
  description = "Log level"
  type        = number
  default     = 4
}

variable "max_empty_bulk_delete_flag" {
  description = "Max empty bulk delete flag"
  type        = number
  default     = 10
}

variable "max_node_provision_time" {
  description = "Max node provision time"
  type        = number
  default     = 15
}

variable "max_nodes_total" {
  description = "Max nodes total"
  type        = number
  default     = 10
}

variable "multi_az_enabled" {
  description = "Multi AZ"
  type        = bool
  default     = false
}

variable "new_ephemeral_volumes_pod_scale_up_delay" {
  description = "New ephemeral volumes pod scale up delay"
  type        = number
  default     = 10
}

variable "node_match_expressions" {
  description = "Node match expressions"
  type        = list(string)
  default     = []
}

variable "expander" {
  description = "Expander"
  type        = string
  default     = "priority,least-waste"
}

variable "scale_down" {
  description = "Scale down configuration"
  type = object({
    delay_after_add       = optional(number, 10)
    delay_after_delete    = optional(number, 10)
    delay_after_failure   = optional(number, 3)
    enabled               = optional(bool, true)
    unneeded_time         = optional(number, 10)
    utilization_threshold = optional(number, 0.5)
  })
  default = {}
}

variable "scale_up" {
  description = "Scale up configuration"
  type = object({
    cpu_utilization_threshold = optional(number, 1)
    mem_utilization_threshold = optional(number, 1)
    unscheduled_pod_enabled   = optional(bool, true)
    utilization_enabled       = optional(bool, true)
  })
  default = {}
}

variable "skip_nodes_with_custom_controller_pods" {
  description = "Skip nodes with custom controller pods"
  type        = bool
  default     = true
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}

variable "tolerations" {
  description = "Kubernetes tolerations"
  #TODO: fix type
  type = any
  default = [
    {
      "effect" : "NoExecute",
      "key" : "node.kubernetes.io/not-ready",
      "operator" : "Exists",
      "tolerationSeconds" : 60
    },
    {
      "effect" : "NoExecute",
      "key" : "node.kubernetes.io/unreachable",
      "operator" : "Exists",
      "tolerationSeconds" : 60
    }
  ]
}

variable "unremovable_node_recheck_timeout" {
  description = "Unremovable node recheck timeout"
  type        = number
  default     = 5
}

##
# Add-on Autoscaler Flavor
##

variable "replicas" {
  description = "Number of replicas"
  type        = number
  default     = 1
}

variable "metrics_server_version" {
  description = "Version of Autoscaler addon"
  type        = string
  default     = "1.3.2"
}

variable "resources" {
  description = "Kubernetes resources"
  type = object({
    limits_cpu   = optional(string, "1000m")
    limits_mem   = optional(string, "1000Mi")
    requests_cpu = optional(string, "500m")
    requests_mem = optional(string, "500Mi")
  })
  default = {}
}

variable "recommend_cluster_flavor_types" {
  description = "Recommend cluster flavor types"
  type        = list(string)
  default = [
    "small"
  ]
}

variable "category" {
  description = "Category"
  type        = list(string)
  default = [
    "CCE",
    "Turbo"
  ]
}
