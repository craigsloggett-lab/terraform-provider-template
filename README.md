# terraform-provider-template

A GitHub repository template for developing a new Terraform provider.

## Usage

The following files require your attention immediately after creating a
repository from this template:

- [ ] `.github/CODEOWNERS`
- [ ] `.github/workflows/release.yml`
- [ ] `go.mod`
- [ ] `main.go`
- [ ] `Makefile`
- [ ] `README.md`

## Required Secrets

The following secrets must be added to the GitHub repository:

| Secret Name                  | Description                                                                                     |
| ---------------------------- | ----------------------------------------------------------------------------------------------- |
| `GPG_PRIVATE_KEY`            | The GPG private key used to sign provider releases before publishing to the Terraform registry. |
| `GPG_PRIVATE_KEY_PASSPHRASE` | The passphrase for the GPG private signing key.                                                 |
