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
