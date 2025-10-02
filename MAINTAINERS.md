# Fork Maintenance Guide

This fork keeps the charts usable and community-maintained after upstream changes. Use this guide to rebrand, publish, and keep images working without Bitnami access.

## Decide Your Targets
- Registry namespace: choose where to publish charts (e.g., `oci://ghcr.io/<org>/charts`).
- Image strategy: keep Bitnami images (override via values) or switch to vendor/community images per chart.

## Quick Start (Packaging & Pushing)
- Enable OCI: `export HELM_EXPERIMENTAL_OCI=1`
- Package a chart: `helm package sommerit/<chart> -d dist/`
- Push to your registry: `helm push dist/<chart>-<version>.tgz oci://<your-registry-namespace>`

## Override Container Images Without Editing Charts
Most charts expose global overrides:
- Registry: `--set global.imageRegistry=<registry>`
- Pull secrets: `--set global.imagePullSecrets[0].name=<secret>`
- Example: `helm install my-release oci://ghcr.io/sommerit/charts/<chart> --set global.imageRegistry=REGISTRY_NAME`

## Bulk Audit of Image References
- Run: `bash tools/audit-images.sh`
- Output shows `repository`, `registry`, `tag`, and related keys for each `values.yaml`.
- Use this to plan per-chart defaults if moving off Bitnami images.

## Rebranding Checklist
- Update install commands in docs to `oci://<your-registry-namespace>/<chart>` once you select a registry.
- Replace badges/links that point to upstream if needed.
- Keep SPDX/Apache-2.0 headers intact unless you have legal approval to change them.

## Artifact Hub Publishing
- Register an OCI Helm repository in Artifact Hub: `oci://ghcr.io/sommerit/charts`.
- Set Content URL to this GitHub repo so Artifact Hub can read `artifacthub-repo.yml` and per-chart `.artifacthub/pkg.yml`.
- Copy the generated `repositoryID` (UUID) into `artifacthub-repo.yml` and commit.
- Add repo secrets: `ARTIFACTHUB_WEBHOOK_URL` and `ARTIFACTHUB_WEBHOOK_SECRET` (from Artifact Hub settings) so the refresh workflow can trigger indexing.
- Ensure each chart has useful metadata; new charts should include `template/CHART_NAME/.artifacthub/pkg.yml` adapted to the chart.

## PR & Versioning
- One chart per PR. Bump `version` in `sommerit/<chart>/Chart.yaml` per semver on any change.
- Sign-off commits with `git commit -s` (DCO).

## CI Notes
Existing workflows enforce one-chart-per-PR, license headers, changelog, and README generation. Adjust as needed if your forked process differs or network-restricted runners are used.
