output "repository_id" {
  description = "Artifact Registry repository OCID."
  value       = oci_artifacts_repository.this.id
}

output "repository_name" {
  description = "Resolved Artifact Registry repository display name."
  value       = oci_artifacts_repository.this.display_name
}

output "repository_type" {
  description = "Artifact Registry repository type."
  value       = oci_artifacts_repository.this.repository_type
}

output "repository" {
  description = "Artifact Registry repository resource."
  value       = oci_artifacts_repository.this
}
