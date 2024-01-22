data "huaweicloud_cce_cluster" "cluster" {
  id = var.cluster_id
}

resource "huaweicloud_cce_addon" "autoscaler" {
  cluster_id    = var.cluster_id
  region        = var.region
  template_name = "autoscaler"
  version       = var.addon_version

  values {
    basic_json = jsonencode(
      {
        "cceEndpoint" : format("https://cce.%s.myhuaweicloud.com", var.region),
        "cluster_version" : data.huaweicloud_cce_cluster.cluster.cluster_version,
        "ecsEndpoint" : format("https://ecs.%s.myhuaweicloud.com", var.region),
        "image_version" : var.addon_version,
        "platform" : var.platform,
        "rbac_enabled" : var.rbac_enabled,
        "region" : var.region,
        "swr_addr" : var.swr_addr == null ? format("swr.%s.myhuaweicloud.com", var.region) : var.swr_addr,
        "swr_user" : var.swr_user
      }
    )
    custom_json = jsonencode(
      {
        "cluster_id" : data.huaweicloud_cce_cluster.cluster.id,
        "coresTotal" : var.cores_total,
        "memoryTotal" : var.memory_total,
        "expander" : var.expander,
        "localVolumeNodeScalingEnabled" : var.local_volume_node_scaling_enabled,
        "logLevel" : var.log_level,
        "maxEmptyBulkDeleteFlag" : var.max_empty_bulk_delete_flag,
        "maxNodeProvisionTime" : var.max_node_provision_time,
        "maxNodesTotal" : var.max_nodes_total,

        "multiAZEnabled" : var.multi_az_enabled,
        "networkMode" : data.huaweicloud_cce_cluster.cluster.container_network_type,
        "newEphemeralVolumesPodScaleUpDelay" : var.new_ephemeral_volumes_pod_scale_up_delay,
        "node_match_expressions" : var.node_match_expressions,
        "skipNodesWithCustomControllerPods" : var.skip_nodes_with_custom_controller_pods,
        "tenant_id" : var.tenant_id,
        "tolerations" : var.tolerations,
        "unremovableNodeRecheckTimeout" : var.unremovable_node_recheck_timeout,

        # Scale down
        "scaleDownDelayAfterAdd" : var.scale_down.delay_after_add,
        "scaleDownDelayAfterDelete" : var.scale_down.delay_after_delete,
        "scaleDownDelayAfterFailure" : var.scale_down.delay_after_failure,
        "scaleDownEnabled" : var.scale_down.enabled,
        "scaleDownUnneededTime" : var.scale_down.unneeded_time,
        "scaleDownUtilizationThreshold" : var.scale_down.utilization_threshold,

        # Scale up
        "scaleUpCpuUtilizationThreshold" : var.scale_up.cpu_utilization_threshold,
        "scaleUpMemUtilizationThreshold" : var.scale_up.mem_utilization_threshold,
        "scaleUpUnscheduledPodEnabled" : var.scale_up.unscheduled_pod_enabled,
        "scaleUpUtilizationEnabled" : var.scale_up.utilization_enabled
      }
    )
    flavor_json = jsonencode(
      {
        "category" : var.category,
        "description" : "Autoscaler",
        "is_default" : true,
        "name" : "autoscaler",
        "recommend_cluster_flavor_types" : var.recommend_cluster_flavor_types,
        "replicas" : var.replicas,
        "resources" : [
          {
            "name" : "autoscaler",
            "limitsCpu" : var.resources.limits_cpu,
            "limitsMem" : var.resources.limits_mem,
            "requestsCpu" : var.resources.requests_cpu,
            "requestsMem" : var.resources.requests_mem
          }
        ]
      }
    )
  }
}
