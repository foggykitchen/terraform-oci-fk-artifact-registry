# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_artifacts_repository" {
    defaults = { "id" = "MOCK_OCID_REPOSITORY", "state" = "AVAILABLE", "time_created" = "mock-value" }
  }
}
variables {
  tenancy_ocid     = "MOCK_OCID_TENANCY"
  user_ocid        = "MOCK_OCID_MOCK"
  fingerprint      = "compatibility"
  private_key_path = "/unused-by-mock"
  region           = "eu-frankfurt-1"
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
}

run "oci9_plan" {
  command = plan
}
