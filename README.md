**I. Seting up Kubernetes Cluster locally**

**1. Install k3d ([Click Here](https://github.com/rancher/k3d))**

You have several options there:

- Use the install script to grab the latest release:

  `wget: wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash`
  `curl: curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash`

- Use the install script to grab a specific release (via TAG environment variable):

  `wget: wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0 bash`
  `curl: curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | TAG=v4.0.0 bash`

- Use Homebrew: brew install k3d (Homebrew is available for MacOS and Linux)

  Formula can be found in homebrew/homebrew-core and is mirrored to homebrew/linuxbrew-core
  install via MacPorts: `sudo port selfupdate && sudo port install k3d` (MacPorts is available for MacOS)

- Install via AUR package rancher-k3d-bin: `yay -S rancher-k3d-bin`

- Install via go: `go install github.com/rancher/k3d (Note: this will give you unreleased/bleeding-edge changes)`

- Use Chocolatey: `choco install k3d (Chocolatey package manager is available for Windows)`

  package source can be found in erwinkersten/chocolatey-packages

**2. Create simple cluster**

Check out what you can do via k3d help or check the docs @ k3d.io

Example Workflow: Create a new cluster and use it with kubectl

- `k3d cluster create CLUSTER_NAME -p "80:80@loadbalancer"` to create a new single-node cluster (= 1 container running k3s + 1 loadbalancer container)
  > -p "80:80@loadbalancer" means - map port 80 from the host to port 80 on the container which matches the nodefilter loadbalancer - the loadbalancer nodefilter matches only the serverlb that's deployed in front of a cluster's server nodes - all ports exposed on the serverlb will be proxied to the same ports on all server nodes in the cluster

- `kubectl config use-context k3d-k3s-default` to switch kubernetes context


**II. Work with Infrastructure As Code (Terraform)**

