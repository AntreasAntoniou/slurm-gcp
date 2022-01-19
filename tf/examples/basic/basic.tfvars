cluster_name = "tali-cluster"
project      = "tali-multi-modal"
zone         = "us-central1-f"

# network_name            = "<existing network name>"
# subnetwork_name         = "<existing subnetwork name>"
# shared_vpc_host_project = "<vpc host project>"

# disable_controller_public_ips = true
# disable_login_public_ips      = true
# disable_compute_public_ips    = true

# suspend_time       = 300
# complete_wait_time = 0

controller_machine_type = "n1-standard-4"
controller_image        = "projects/tali-multi-modal/global/images/tali-cluster-controller-v-1-0"
controller_disk_type    = "pd-standard"
controller_disk_size_gb = 100
#controller_service_account = "tali-multi-modal@tali-multi-modal.iam.gserviceaccount.com"

# controller_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# controller_service_account = "default"
# controller_scopes          = ["https://www.googleapis.com/auth/cloud-platform"]
# cloudsql = {
#   server_ip = "<cloudsql ip>"
#   user      = "slurm"
#   password  = "verysecure"
#   db_name   = "slurm_accounting"
# }
# controller_secondary_disk      = false
# controller_secondary_disk_size = 100
# controller_secondary_disk_type = "pd-ssd"
#
# When specifying an instance template, specified controller fields will
# override the template properties.
# controller_instance_template = null

# controller_startup_script = <<-EOT
# #!/bin/bash
# echo startup script in the tfvars > custom-controller-ran-var.txt
# EOT

login_machine_type = "n1-standard-2"
login_image        = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-21-08-4-debian-10"
login_disk_type    = "pd-standard"
login_disk_size_gb = 20
#login_service_account = "tali-multi-modal@tali-multi-modal.iam.gserviceaccount.com"

# login_labels = {
#   key1 = "val1"
#   key2 = "val2"
# }
# login_node_count = 1
# login_node_service_account = "default"
# login_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]
#
# When specifying an instance template, specified login fields will
# override the template properties.
# login_instance_template = null

# login_startup_script = <<-EOT
# #!/bin/bash
# echo startup script in the tfvars > custom-login-ran-var.txt
# EOT

# Optional network storage fields
# network_storage is mounted on all instances
# login_network_storage is mounted on controller and login instances
# network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/home"
#   local_mount   = "/home"
#   fs_type       = "nfs"
#   mount_options = null
# }]
#
# login_network_storage = [{
#   server_ip     = "<storage host>"
#   remote_mount  = "/net_storage"
#   local_mount   = "/shared"
#   fs_type       = "nfs"
#   mount_options = null
# }]

# compute_node_service_account = "default"
# compute_node_scopes          = [
#   "https://www.googleapis.com/auth/monitoring.write",
#   "https://www.googleapis.com/auth/logging.write"
# ]

# compute_startup_script = <<-EOT
# #!/bin/bash
# echo startup script in the tfvars > custom-compute-ran-var.txt
# EOT

partitions = [

  { name                 = "worker-small"
    machine_type         = "a2-highgpu-1g"
    static_node_count    = 4
    max_node_count       = 20
    zone                 = "us-central1-f"
    image                = "projects/schedmd-slurm-public/global/images/family/schedmd-slurm-21-08-4-debian-10"
    image_hyperthreads   = true
    cpu_platform         = null
    compute_disk_type    = "pd-standard"
    compute_disk_size_gb = 350
    compute_labels       = {}
    regional_capacity    = false
    regional_policy      = {}
    gpu_count            = 1
    gpu_type             = "nvidia-tesla-a100"
    network_storage      = []
    preemptible_bursting = "spot"
    vpc_subnet           = null
    exclusive            = false
    enable_placement     = false
    regional_capacity    = false
    regional_policy      = {}
    instance_template    = "projects/tali-multi-modal/global/instanceTemplates/gpu-small-node"


#    compute_startup_script = <<-EOT
#    #!/bin/bash
#    export MOUNT_DIR="/mnt/disk/filestore/"
#    export EXPERIMENTS_DIR="/mnt/disk/filestore/experiments/"
#
#    if [ ! -d "$MOUNT_DIR" ]; then
#      sudo mkdir -p $MOUNT_DIR
#      sudo chmod -Rv 777 $MOUNT_DIR
#    fi
#
#    if [ ! -d "$EXPERIMENTS_DIR" ]; then
#      sudo mkdir -p $EXPERIMENTS_DIR
#      sudo chmod -Rv 777 $EXPERIMENTS_DIR
#    fi
#    ########################################################################################
#    export DATASET_DIR="/mnt/disk/filestore/tali-dataset/"
#
#    if [ ! -d "$DATASET_DIR" ]; then
#      sudo mkdir -p $DATASET_DIR
#      sudo chmod -Rv 777 $DATASET_DIR
#    fi
#
#    sudo mount -o discard,defaults /dev/sdb $DATASET_DIR
#
#    #sudo chmod -Rv 777 $DATASET_DIR
#    ########################################################################################
#    EOT

    # With regional_capacity : true, the region can be specified in the zone.
    # Otherwise the region will be inferred from the zone.


    # When specifying an instance template, specified compute fields will
    # override the template properties
  }
]


