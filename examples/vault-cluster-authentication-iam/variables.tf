# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These parameters must be supplied when consuming this module.
# ---------------------------------------------------------------------------------------------------------------------

variable "gcp_project_id" {
  description = "The name of the GCP Project where all resources will be launched."
  type        = string
}

variable "gcp_region" {
  description = "The Region in which all GCP resources will be launched."
  type        = string
}

variable "subnet_ip_cidr_range" {
  description = "The cidr range for the subnetwork. Ex.: 10.1.0.0/16"
  type        = string
}

variable "web_client_name" {
  description = "The name of the server that authenticates to vault"
  type        = string
}

variable "vault_cluster_name" {
  description = "The name of the Vault Server cluster. All resources will be namespaced by this value. E.g. vault-server-prod"
  type        = string
}

variable "vault_source_image" {
  description = "The Google Image used to launch each node in the Vault Server cluster."
  type        = string
}

variable "vault_cluster_machine_type" {
  description = "The machine type of the Compute Instance to run for each node in the Vault cluster (e.g. n1-standard-1)."
  type        = string
}

variable "consul_server_cluster_name" {
  description = "The name of the Consul Server cluster. All resources will be namespaced by this value. E.g. consul-server-prod"
  type        = string
}

variable "consul_server_source_image" {
  description = "The Google Image used to launch each node in the Consul Server cluster."
  type        = string
}

variable "consul_server_machine_type" {
  description = "The machine type of the Compute Instance to run for each node in the Consul Server cluster (e.g. n1-standard-1)."
  type        = string
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "example_secret" {
  description = "An example secret written to the vault cluster, for test purposes"
  type        = string
  default     = "42"
}

variable "web_service_account_iam_roles" {
  description = "Roles that the web client service account can operate on project"
  type        = list(string)

  default = [
    "roles/iam.serviceAccountTokenCreator",
    "roles/viewer",
  ]
}

variable "gcs_bucket_location" {
  description = "The location of the Google Cloud Storage Bucket where Vault secrets will be stored. For details, see https://goo.gl/hk63jH."
  type        = string
  default     = "US"
}

variable "gcs_bucket_class" {
  description = "The Storage Class of the Google Cloud Storage Bucket where Vault secrets will be stored. Must be one of MULTI_REGIONAL, REGIONAL, NEARLINE, or COLDLINE. For details, see https://goo.gl/hk63jH."
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "gcs_bucket_force_destroy" {
  description = "If true, Terraform will delete the Google Cloud Storage Bucket even if it's non-empty. WARNING! Never set this to true in a production setting. We only have this option here to facilitate testing."
  type        = bool
  default     = true
}

variable "vault_cluster_size" {
  description = "The number of nodes to have in the Vault Server cluster. We strongly recommended that you use either 3 or 5."
  type        = number
  default     = 1
}

variable "consul_server_cluster_size" {
  description = "The number of nodes to have in the Consul Server cluster. We strongly recommended that you use either 3 or 5."
  type        = number
  default     = 1
}

variable "root_volume_disk_size_gb" {
  description = "The size, in GB, of the root disk volume on each Consul node."
  type        = number
  default     = 30
}

variable "root_volume_disk_type" {
  description = "The GCE disk type. Can be either pd-ssd, local-ssd, or pd-standard"
  type        = string
  default     = "pd-standard"
}

variable "enable_vault_ui" {
  description = "If true, enable the Vault UI"
  type        = bool
  default     = true
}

variable "network_name" {
  description = "The name of the VPC Network where all resources should be created."
  type        = string
  default     = "default"
}
