# Repository Guidelines

## Project Structure & Module Organization
- Root: Helm charts under `sommerit/<chart>/` (one folder per chart).
- Template: `template/CHART_NAME/` scaffold for new charts; includes `.helmignore` and a README template.
- CI & templates: `.github/workflows/` for checks (linting, headers, changelog) and `.licenserc.yaml` for license headers.
- Docs & policies: `README.md`, `CONTRIBUTING.md`, `CODE_OF_CONDUCT.md`, `SECURITY.md`.

## Build, Test, and Development Commands
- Lint a chart: `helm lint sommerit/<chart>` — validate chart structure and values.
- Update deps: `helm dependency update sommerit/<chart>` — vendor chart dependencies.
- Render locally: `helm template test sommerit/<chart> -f sommerit/<chart>/values.yaml` — check rendered manifests.
- README generator: `npm i -g @bitnami/readme-generator-for-helm && readme-generator --values sommerit/<chart>/values.yaml --readme sommerit/<chart>/README.md --schema /tmp/schema.json` — refresh parameters table after editing `values.yaml`.
- Markdown lint (optional): use a markdown linter honoring `.markdownlint.json`.

## Coding Style & Naming Conventions
- YAML: 2‑space indentation; wrap lines sensibly; avoid trailing spaces.
- Helm: follow Helm best practices; never hardcode images in templates — use `.Values.<...>.image.registry|repository|tag`.
- Headers: add required SPDX header in Helm templates per `.licenserc.yaml`.
- Naming: chart folders and names are lowercase, hyphen-separated (e.g., `sommerit/grafana-operator`).

## Testing Guidelines
- Run `helm lint` and `helm template` on changed charts.
- Validate values: ensure new parameters are documented in `values.yaml` with `@param` metadata and reflected in `README.md` via the generator.
- Keep compatibility: avoid breaking defaults; if necessary, document clearly and bump version accordingly.

## Commit & Pull Request Guidelines
- One chart per PR; bump `version` in `sommerit/<chart>/Chart.yaml` per semver for any chart change.
- Sign-off required: use `git commit -s` (DCO enforced).
- PR title format: `[sommerit/<chart>] <concise description>`.
- Include: summary of changes, rationale, and any applicable issue references (e.g., `fixes #123`).
- Do not modify multiple charts or unrelated files in the same PR; CI will skip or fail if version bumps are missing.

## Security & Configuration Tips
- Never commit secrets; reference Kubernetes Secrets and use values for sensitive config.
- Prefer configuration via `values.yaml`; keep defaults secure and minimal.
