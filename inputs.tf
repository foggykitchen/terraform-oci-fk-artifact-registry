variable "compartment_ocid" {
  description = "OCI compartment OCID where the Artifact Registry repository is created."
  type        = string
}

variable "name" {
  description = "Base repository display name used when display_name is not provided."
  type        = string
}

variable "display_name" {
  description = "Optional explicit Artifact Registry repository display name."
  type        = string
  default     = null
}

variable "description" {
  description = "Optional Artifact Registry repository description."
  type        = string
  default     = null
}

variable "repository_type" {
  description = "Artifact Registry repository type. Use GENERIC for OCI DevOps binary artifacts."
  type        = string
  default     = "GENERIC"

  validation {
    condition     = contains(["GENERIC"], var.repository_type)
    error_message = "repository_type currently supports GENERIC."
  }
}

variable "is_immutable" {
  description = "Whether artifacts in the repository are immutable."
  type        = bool
  default     = false
}

variable "defined_tags" {
  description = "Defined tags applied to the repository."
  type        = map(string)
  default     = {}
}

variable "freeform_tags" {
  description = "Freeform tags applied to the repository."
  type        = map(string)
  default     = {}
}
