locals {
  resolved_display_name = coalesce(var.display_name, var.name)
}

resource "oci_artifacts_repository" "this" {
  compartment_id  = var.compartment_ocid
  display_name    = local.resolved_display_name
  description     = var.description
  repository_type = var.repository_type
  is_immutable    = var.is_immutable
  defined_tags    = var.defined_tags
  freeform_tags   = var.freeform_tags
}
