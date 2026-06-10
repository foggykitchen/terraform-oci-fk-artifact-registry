module "artifact_registry" {
  source = "../../"

  compartment_ocid = var.compartment_ocid
  name             = "fk-generic-artifacts"
  description      = "Generic Artifact Registry repository for OCI DevOps binary artifacts"

  freeform_tags = {
    project    = "foggykitchen"
    managed_by = "opentofu"
  }
}
