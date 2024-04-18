# Huawei Cloud CCE Addon Autoscaler

+ [Add-ons documentation](https://support.huaweicloud.com/intl/en-us/usermanual-cce/cce_10_0064.html)
+ [CCE Addon autoscaler template](https://github.com/huaweicloud/terraform-provider-huaweicloud/blob/master/examples/cce/basic/cce-addon-templates.md#autoscaler)
+ [Autoscaler repo](https://github.com/kubernetes/autoscaler/tree/master)
To get information about add-on use the following data `huaweicloud_cce_addon_template`.

Example for `autoscaler` add-on

```hcl
data "huaweicloud_cce_addon_template" "test" {
  cluster_id = var.cce_cluster_id
  name       = "autoscaler"
  version    = "1.25.46"
}

output "version" {
  value = data.huaweicloud_cce_addon_template.test
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.7 |
| <a name="requirement_huaweicloud"></a> [huaweicloud](#requirement\_huaweicloud) | ~>1.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_huaweicloud"></a> [huaweicloud](#provider\_huaweicloud) | ~>1.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [huaweicloud_cce_addon.autoscaler](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/resources/cce_addon) | resource |
| [huaweicloud_cce_cluster.cluster](https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs/data-sources/cce_cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addon_version"></a> [addon\_version](#input\_addon\_version) | Version of Autoscaler addon | `string` | `"1.25.46"` | no |
| <a name="input_category"></a> [category](#input\_category) | Category | `list(string)` | <pre>[<br>  "CCE",<br>  "Turbo"<br>]</pre> | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | Specifies the CCE cluster ID | `string` | n/a | yes |
| <a name="input_cores_total"></a> [cores\_total](#input\_cores\_total) | Total number of cores | `number` | `64` | no |
| <a name="input_expander"></a> [expander](#input\_expander) | Expander | `string` | `"priority,least-waste"` | no |
| <a name="input_local_volume_node_scaling_enabled"></a> [local\_volume\_node\_scaling\_enabled](#input\_local\_volume\_node\_scaling\_enabled) | Local volume node scaling enabled | `bool` | `false` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level | `number` | `4` | no |
| <a name="input_max_empty_bulk_delete_flag"></a> [max\_empty\_bulk\_delete\_flag](#input\_max\_empty\_bulk\_delete\_flag) | Max empty bulk delete flag | `number` | `10` | no |
| <a name="input_max_node_provision_time"></a> [max\_node\_provision\_time](#input\_max\_node\_provision\_time) | Max node provision time | `number` | `15` | no |
| <a name="input_max_nodes_total"></a> [max\_nodes\_total](#input\_max\_nodes\_total) | Max nodes total | `number` | `10` | no |
| <a name="input_memory_total"></a> [memory\_total](#input\_memory\_total) | Memory total | `number` | `128` | no |
| <a name="input_metrics_server_version"></a> [metrics\_server\_version](#input\_metrics\_server\_version) | Version of Autoscaler addon | `string` | `"1.3.2"` | no |
| <a name="input_multi_az_enabled"></a> [multi\_az\_enabled](#input\_multi\_az\_enabled) | Multi AZ | `bool` | `false` | no |
| <a name="input_new_ephemeral_volumes_pod_scale_up_delay"></a> [new\_ephemeral\_volumes\_pod\_scale\_up\_delay](#input\_new\_ephemeral\_volumes\_pod\_scale\_up\_delay) | New ephemeral volumes pod scale up delay | `number` | `10` | no |
| <a name="input_node_match_expressions"></a> [node\_match\_expressions](#input\_node\_match\_expressions) | Node match expressions | `list(string)` | `[]` | no |
| <a name="input_platform"></a> [platform](#input\_platform) | Platform | `string` | `"linux-amd64"` | no |
| <a name="input_rbac_enabled"></a> [rbac\_enabled](#input\_rbac\_enabled) | Kubernetes rbac enabled | `bool` | `true` | no |
| <a name="input_recommend_cluster_flavor_types"></a> [recommend\_cluster\_flavor\_types](#input\_recommend\_cluster\_flavor\_types) | Recommend cluster flavor types | `list(string)` | <pre>[<br>  "small"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Specifies the region in which to create the CCE node pool resource, if omitted, the provider-level region will be used | `string` | n/a | yes |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | Number of replicas | `number` | `1` | no |
| <a name="input_resources"></a> [resources](#input\_resources) | Kubernetes resources | <pre>object({<br>    limits_cpu   = optional(string, "1000m")<br>    limits_mem   = optional(string, "1000Mi")<br>    requests_cpu = optional(string, "500m")<br>    requests_mem = optional(string, "500Mi")<br>  })</pre> | `{}` | no |
| <a name="input_scale_down"></a> [scale\_down](#input\_scale\_down) | Scale down configuration | <pre>object({<br>    delay_after_add       = optional(number, 10)<br>    delay_after_delete    = optional(number, 10)<br>    delay_after_failure   = optional(number, 3)<br>    enabled               = optional(bool, true)<br>    unneeded_time         = optional(number, 10)<br>    utilization_threshold = optional(number, 0.5)<br>  })</pre> | `{}` | no |
| <a name="input_scale_up"></a> [scale\_up](#input\_scale\_up) | Scale up configuration | <pre>object({<br>    cpu_utilization_threshold = optional(number, 1)<br>    mem_utilization_threshold = optional(number, 1)<br>    unscheduled_pod_enabled   = optional(bool, true)<br>    utilization_enabled       = optional(bool, true)<br>  })</pre> | `{}` | no |
| <a name="input_skip_nodes_with_custom_controller_pods"></a> [skip\_nodes\_with\_custom\_controller\_pods](#input\_skip\_nodes\_with\_custom\_controller\_pods) | Skip nodes with custom controller pods | `bool` | `true` | no |
| <a name="input_swr_addr"></a> [swr\_addr](#input\_swr\_addr) | SWR Address | `string` | `null` | no |
| <a name="input_swr_user"></a> [swr\_user](#input\_swr\_user) | SWR User name | `string` | `"hwofficial"` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |
| <a name="input_tolerations"></a> [tolerations](#input\_tolerations) | Kubernetes tolerations | `any` | <pre>[<br>  {<br>    "effect": "NoExecute",<br>    "key": "node.kubernetes.io/not-ready",<br>    "operator": "Exists",<br>    "tolerationSeconds": 60<br>  },<br>  {<br>    "effect": "NoExecute",<br>    "key": "node.kubernetes.io/unreachable",<br>    "operator": "Exists",<br>    "tolerationSeconds": 60<br>  }<br>]</pre> | no |
| <a name="input_unremovable_node_recheck_timeout"></a> [unremovable\_node\_recheck\_timeout](#input\_unremovable\_node\_recheck\_timeout) | Unremovable node recheck timeout | `number` | `5` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->