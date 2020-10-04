#!/bin/bash

# Colors
bold='\033[1m'
blue='\033[34m'
bblue='\033[1;96m'
reset='\033[0m'

# Config
trap 'rm -f docker.log kubectl.log; exit 1' 2 3

conf_minikube()
{
    export MINIKUBE_HOME="$HOME/goinfre/.minikube";
    export PATH="$MINIKUBE_HOME/bin:$PATH";
    export KUBECONFIG="$MINIKUBE_HOME/.kube/config";
    export MINIKUBE_ACTIVE_DOCKERD=minikube;
    export KUBE_EDITOR="code -w";
}

dependencies()
{
    # Install brew if not present
    command -v brew 2>&1 > /dev/null || ( curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh && zsh );

    # Check whether minikube is installed. Install if necessary
    if [[ -z "$(brew list | grep minikube)" ]]; then 
        printf "${blue}Minikube not found. Installing ${bblue}minikube${reset}\n"
        pkill VBox VirtualBox
        brew install minikube 
    fi

    # Uninstall docker, docker-compose and docker-machine if they are installed with brew
    for app in docker docker-compose docker-machine; do
        [[ -n "$(brew list | grep $app)" ]] && brew uninstall -f $app
    done

    # Check if DockerToolbox is installed with MSC and open MSC if not
    if [[ ! -f '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh' ]]; then
        printf "${blue}Please install ${bblue}Docker for Mac ${blue}from the MSC (Managed Software Center)${reset}\n"
        open -a "Managed Software Center"
        read -n1 -p "${blue}Press RETURN when you have successfully installed ${bblue}Docker for Mac${blue}...${reset}\n"
    fi
}

# Init minikube
init_minikube()
{
    minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB;
    minikube addons enable metallb;
    minikube addons enable dashboard;
}

# Build the cluster
build_cluster()
{
    local pods="nginx mysql influxdb wordpress phpmyadmin telegraf grafana ftps"

    printf "🧱  Building the cluster\n"
    kubectl apply -f yaml/metallb.yaml > docker.log > kubectl.log
    for pod in $pods; do
        printf "    ▪ Building $pod\n"
        docker build -t $pod ./$pod/ >> docker.log 2>&1 
        kubectl create -f yaml/$pod.yaml >> kubectl.log 2>&1
    done
}

cd srcs
# Set minikube home to goinfre if we're at school
[[ -d ~/goinfre ]] && conf_minikube && dependencies
init_minikube
eval $(minikube docker-env)
build_cluster

printf "${bold}👍  Done! ${reset}Launching dashboard...\n"
minikube dashboard;