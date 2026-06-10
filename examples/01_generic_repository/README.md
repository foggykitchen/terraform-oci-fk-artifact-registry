# Generic Artifact Registry Repository

This example creates a minimal OCI Artifact Registry repository of type `GENERIC`.

The repository can be used by OCI DevOps build pipelines to deliver binary artifacts such as application `tar.gz` packages for compute instance group deployments.

## Usage

```bash
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

## Cleanup

```bash
tofu destroy
```

## License

Licensed under the Universal Permissive License (UPL), Version 1.0. See [LICENSE](../../LICENSE) for details.

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
