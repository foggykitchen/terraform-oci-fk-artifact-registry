# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_artifacts_repository" {
    defaults = { "id" = "MOCK_OCID_REPOSITORY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
}
variables {
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
  name             = "compatibility"
}

run "oci9_plan" {
  command = plan
}
