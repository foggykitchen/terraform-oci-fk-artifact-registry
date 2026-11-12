# terraform-oci-fk-artifact-registry

This repository contains a reusable **Terraform/OpenTofu module** for creating an **Oracle Cloud Infrastructure (OCI) Artifact Registry** repository.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/)** and is designed to compose with modules such as **`terraform-oci-fk-devops`**, **`terraform-oci-fk-devops-pipeline`**, and **`terraform-oci-fk-policy`**.

---

## Purpose

The goal of this module is to provide a focused wrapper for OCI Artifact Registry repositories used by OCI DevOps and other artifact delivery flows.

This module is intentionally narrow:

- it creates an Artifact Registry repository
- it does not create IAM dynamic groups or policies
- it does not create OCI DevOps projects, pipelines, or deploy artifacts
- it does not upload artifact versions

IAM concerns belong in `terraform-oci-fk-policy`. OCI DevOps concerns belong in `terraform-oci-fk-devops` and `terraform-oci-fk-devops-pipeline`.

---

## What the module creates

- OCI Artifact Registry repository using `oci_artifacts_repository`

The default repository type is `GENERIC`, which is suitable for OCI DevOps binary artifacts such as `tar.gz` application packages used by compute instance group deployments.

---

## Repository Structure

```bash
terraform-oci-fk-artifact-registry/
├── examples/
│   ├── 01_generic_repository/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

---

## Example Usage

```hcl
module "artifact_registry" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-artifact-registry.git?ref=v0.2.0"

  compartment_ocid = var.compartment_ocid
  name             = "fk-devops-instance-group-artifacts"
  description      = "Generic artifact repository for OCI DevOps instance group application packages"

  freeform_tags = {
    project    = "foggykitchen"
    managed_by = "opentofu"
  }
}
```

---

## Module Inputs

| Variable | Type | Required | Description |
| --- | --- | --- | --- |
| `compartment_ocid` | `string` | yes | OCI compartment OCID |
| `name` | `string` | yes | Base repository display name when `display_name` is not provided |
| `display_name` | `string` | no | Optional explicit repository display name |
| `description` | `string` | no | Optional repository description |
| `repository_type` | `string` | no | Artifact Registry repository type, defaults to `GENERIC` |
| `is_immutable` | `bool` | no | Whether artifacts in the repository are immutable |
| `defined_tags` | `map(string)` | no | Defined tags |
| `freeform_tags` | `map(string)` | no | Freeform tags |

---

## Outputs

| Output | Description |
| --- | --- |
| `repository_id` | Artifact Registry repository OCID |
| `repository_name` | Resolved repository display name |
| `repository_type` | Artifact Registry repository type |
| `repository` | Full Artifact Registry repository resource |

---

## Design Philosophy

- Keep Artifact Registry separate from IAM and DevOps orchestration.
- Use `terraform-oci-fk-policy` for dynamic groups and permissions.
- Use `terraform-oci-fk-devops` for DevOps deploy artifacts that reference this repository.
- Let OCI DevOps build pipelines publish artifact versions at runtime.

---

## License

Licensed under the Universal Permissive License (UPL), Version 1.0. See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.

## Requirements

| Requirement | Version |
|---|---|
| OpenTofu | >= 1.11.0 (tested with 1.11.6) |
| oracle/oci | >= 9.12.1, < 10.0.0 |

## BREAKING: requires OCI provider >= 9.12.1

OCI provider 6.x, 7.x and 8.x are no longer supported. Upgrade all composed modules together, run `tofu init -upgrade`, and review a plan before applying. Existing module inputs, outputs and resource addresses are preserved.

Every embedded example is covered by a plan-only mocked test. CI uses OpenTofu 1.11.6 and exact OCI 9.12.1. Mocked plans verify configuration and expressions; they do not verify tenancy permissions, regional availability or service limits.

Run the same checks locally with `python3 scripts/oci9_check.py --root .` (or an example path). The helper materializes synthetic IDs in a temporary copy. For unpublished integration branches only, `OCI9_ALLOW_UNRELEASED=1` permits an explicitly logged fallback from the proposed tag to `oci-provider-9`; released tags always take precedence. `--modules-dir /path/to/checkouts` tests local migrated dependencies.
