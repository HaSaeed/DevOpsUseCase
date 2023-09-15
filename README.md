**This Repo provides a basic DevOps setup using Gitlab CI/CD**

Following tools are used:
1. Gitlab
2. Python
3. Bash
4. Docker
5. Docker Hub
6. Helm
7. Java

**Pre-Requisites:**
To test this code following tools are required:
1. Gitlab
2. Docker Hub
3. K8s cluster

**Gitlab Variables:**
Following Github CICD variable need to be setup before running the pipeline:
1. DOCKER_USERNAME
2. DOCKER_PASSWORD
3. KUBECONFIG_CONTENT

Note: Also update the Docker Hub repository to your repository

**APPS:**
There are two python apps (app1 and app2), app1 prints Hello every 2 seconds and app2 prints world every 2 seconds on the console.
A sample Hello World java app with its Dockerfile is also present but not used in the CICD.

**CI/CD Workflow:**
1. (Build) Initially a python whl artifacte gets created for both the apps to be used in the later stages.
2. (Test) The whl artifact gets installed and the output gets tested by a unit test written in bash.
3. (Dockerize) The whl artifact is used to install the python package on the Docker image and the start command is sent.
    Both app1 and app2 are using the same Docker repository but the tags are appended by the current commit and the app name.
4. (Deploy) Helm settings are provided inside the repo (basic deployment setup). Helm repo is not used. 
    The Dploy portion updates the current k8s settings (Docker image) to the current one. 
All the stages are dependent on one another so for the next stage to proceed, previous would have to pass. Also, Dockerize and Deploy only run on the default branch.
