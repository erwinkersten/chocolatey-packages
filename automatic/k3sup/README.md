# <img src="https://github.com/alexellis/k3sup/raw/master/docs/assets/k3sup.png" width="200" height="100"/>[](https://get-arkade.dev/)

## k3sup -  k3sup is a light-weight utility to get from zero to KUBECONFIG with k3s on any local or remote VM.

This tool uses ssh to install k3s to a remote Linux host. First, k3s is installed using the utility script from Rancher, along with a flag for your host's public IP so that TLS works properly. The kubeconfig file on the server is then fetched and updated so that you can connect from your laptop using kubectl. You can also use it to join existing Linux hosts into a k3s cluster as agents.

You may wonder why a tool like this needs to exist when you can do this sort of thing with bash.

k3sup was developed to automate what can be a very manual and confusing process for many developers, who are already short on time. Once you've provisioned a VM with your favourite tooling, k3sup means you are only 60 seconds away from running kubectl get pods on your own computer. If you are a local computer, you can bypass SSH with k3sup install --local

The tool is written in Go and is cross-compiled for Linux, Windows, MacOS and even on Raspberry Pi.

How do you say it? Ketchup, as in tomato

Website: https://k3sup.dev/

**Please Note**: This is an automatically updated package. If you find it is out of date by more than a day or two please contact the maintainer(s) and let them know the package is no longer updating correctly.