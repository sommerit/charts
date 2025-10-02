<!-- markdownlint-disable MD041 -->
<p align="center">
    <!-- Forked project: replace with your branding if desired -->
    <img width="300px" height=auto src="https://avatars.githubusercontent.com/u/58627829?s=200&v=4" />
</p>

<p align="center">
    <a href="https://github.com/sommerit/charts"><img src="https://badgen.net/github/stars/sommerit/charts?icon=github" /></a>
    <a href="https://github.com/sommerit/charts"><img src="https://badgen.net/github/forks/sommerit/charts?icon=github" /></a>
    <a href="https://artifacthub.io/packages/search?repo=sommerit"><img src="https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/sommerit" /></a>
</p>

# Sommerit Community Helm Charts

Community-maintained Helm charts forked from Bitnami and adapted for public use.

## TL;DR

```console
helm install my-release oci://ghcr.io/sommerit/charts/<chart>
```

## Notes on the Fork

This repository is a community fork of the original Bitnami charts. Image defaults and templates remain compatible; you can override registries and repositories via chart values. See `AGENTS.md` and `MAINTAINERS.md` for fork-specific guidance.

## Vulnerabilities scanner

Each chart may reference container images. Validate images for your environment and override via `values.yaml` when required.

## Before you begin

### Prerequisites

- Kubernetes 1.23+
- Helm 3.8.0+

### Setup a Kubernetes Cluster

Refer to the Kubernetes documentation for cluster setup on your platform of choice: https://kubernetes.io/docs/setup/

### Install Helm

Helm is a tool for managing Kubernetes charts. Charts are packages of pre-configured Kubernetes resources.

To install Helm, refer to the [Helm install guide](https://github.com/helm/helm#install) and ensure that the `helm` binary is in the `PATH` of your shell.

### Using Helm

Once you have installed the Helm client, you can deploy any chart from this fork into a Kubernetes cluster.

Please refer to the [Quick Start guide](https://helm.sh/docs/intro/quickstart/) if you wish to get running in just a few commands, otherwise, the [Using Helm Guide](https://helm.sh/docs/intro/using_helm/) provides detailed instructions on how to use the Helm client to manage packages on your Kubernetes cluster.

Useful Helm Client Commands:

- Install a chart: `helm install my-release oci://ghcr.io/sommerit/charts/<chart>`
- Upgrade your application: `helm upgrade my-release oci://ghcr.io/sommerit/charts/<chart>`

## License

Copyright &copy; 2025 Broadcom. The term "Broadcom" refers to Broadcom Inc. and/or its subsidiaries.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

<http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
