# Sample repository for SpinKube on Kyma

This repository contains the code needed to easily deploy [SpinKube](https://www.spinkube.dev/) on [Kyma](https://kyma-project.io/#/) (managed version on SAP BTP).

- The overall setup is described in the markdown file [BLOGPOST.md](BLOGPOST.md) giving a broader overview of the setup and the components involved.
- The setup for the service account including its configuration and the scripts needed to fetch the `kubeconfig` is placed in the directory[service-account](service-account/).

The repository also contains a devcontainer configuration comprising the necessary tools for the setup namely `kubectl` and `helm`.
