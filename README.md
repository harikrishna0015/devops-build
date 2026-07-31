DevOps CI/CD Pipeline using Jenkins, Docker, Docker Hub, Prometheus and Grafana

The complete Jenkins CI/CD pipeline, Docker deployment, Prometheus configuration, Grafana dashboards, Node Exporter metrics, cAdvisor metrics and application deployment screenshots have been added in the screenshots folder.

Project Overview

This project demonstrates an end-to-end DevOps CI/CD pipeline for deploying a Dockerized web application using Jenkins. The application source code is hosted in GitHub, Docker images are built and pushed to Docker Hub, and the latest application is automatically deployed to an AWS EC2 instance. Infrastructure and application monitoring are implemented using Prometheus, Grafana, Node Exporter, and cAdvisor.

The project automates the complete software delivery lifecycle from source code commit to deployment and monitoring.

Technologies Used
HTML
CSS
JavaScript
Nginx
Docker
Docker Hub
Jenkins
Git
GitHub
AWS EC2
Prometheus
Grafana
Node Exporter
cAdvisor
Repository

GitHub Repository

https://github.com/harikrishna0015/devops-build

Docker Hub Repository

harikrishna2125/devops-build-prod
Project Structure
devops-build/
├── build/
├── Dockerfile
├── build.sh
├── deploy.sh
├── docker-compose.yml
├── Jenkinsfile
├── prometheus.yml
├── README.md
└── screenshots/
Prerequisites
AWS Account
Ubuntu EC2 Instances
Docker
Docker Hub Account
Jenkins
Git
GitHub
Prometheus
Grafana
Node Exporter
cAdvisor
Continuous Integration

Jenkins automates the complete build process.

Pipeline stages include:

Source Code Checkout
Docker Image Build
Docker Image Tagging
Docker Hub Authentication
Docker Image Push
Build Verification
Docker
Build Docker Image
docker build -t harikrishna2125/devops-build-prod:latest .
Verify Docker Images
docker images
Docker Hub

The Docker image is pushed automatically to Docker Hub.

Repository

harikrishna2125/devops-build-prod
Login
docker login
Push Image
docker push harikrishna2125/devops-build-prod:latest
Continuous Deployment

After a successful build, Jenkins automatically deploys the latest application to the Application EC2 instance.

Deployment Steps

Connect to Application Server
Pull Latest Docker Image
Stop Existing Container
Remove Existing Container
Start New Container
Pull Latest Image
docker pull harikrishna2125/devops-build-prod:latest
Stop Running Container
docker stop devops-app
Remove Existing Container
docker rm devops-app
Start Application Container
docker run -d \
--name devops-app \
-p 80:80 \
--restart unless-stopped \
harikrishna2125/devops-build-prod:latest
Monitoring

Monitoring was implemented using

Prometheus
Grafana
Node Exporter
cAdvisor
Prometheus

Prometheus continuously collects infrastructure and container metrics.

Configured scrape targets

Prometheus
Node Exporter
cAdvisor

Start Prometheus

docker run -d \
--name prometheus \
-p 9090:9090 \
-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus
Node Exporter

Node Exporter collects host-level operating system metrics.

Metrics include

CPU Usage
Memory Usage
Disk Usage
Network Usage
Filesystem Statistics
System Load
cAdvisor

cAdvisor collects Docker container metrics.

Metrics include

Container CPU Usage
Container Memory Usage
Container Network Usage
Filesystem Usage
Running Containers

Start cAdvisor

docker run -d \
--name cadvisor \
-p 8080:8080 \
-v /:/rootfs:ro \
-v /var/run:/var/run:ro \
-v /sys:/sys:ro \
-v /var/lib/docker:/var/lib/docker:ro \
gcr.io/cadvisor/cadvisor:latest
Grafana

Grafana visualizes metrics collected by Prometheus.

Dashboards display

Host CPU Utilization
Host Memory Utilization
Disk Usage
Network Usage
Docker Container Metrics
Prometheus Health
Node Exporter Metrics
cAdvisor Metrics

Start Grafana

docker run -d \
--name grafana \
-p 3000:3000 \
grafana/grafana
Jenkins CI/CD Pipeline

A Declarative Jenkins Pipeline automates the complete deployment workflow.

Pipeline stages include

Source Code Checkout
Docker Image Build
Docker Image Push to Docker Hub
SSH Connection to Application Server
Docker Image Pull
Application Deployment
Deployment Verification
GitHub Integration

The application source code is maintained in GitHub.

GitHub Webhooks automatically trigger the Jenkins pipeline whenever code is pushed to the repository.

Verification

Verify Docker containers

docker ps

Verify Docker images

docker images

Verify Prometheus Targets

Open

http://<Application-EC2-Public-IP>:9090/targets

Verify Grafana

Open

http://<Application-EC2-Public-IP>:3000

Verify Application

Open

http://<Application-EC2-Public-IP>
Application Access

The web application is accessible through the public IP address of the Application EC2 instance.

Monitoring dashboards are accessible through Grafana.

Infrastructure metrics are collected through Prometheus, Node Exporter, and cAdvisor.

Please refer to the screenshots available in the screenshots folder.

Screenshots Included

Please refer to the screenshots folder for:

GitHub Repository
Jenkins Build Success
Jenkins Pipeline Stages
Docker Image Build
Docker Hub Repository
Docker Running Containers
Application Running
Prometheus Targets
Prometheus Dashboard
Grafana Login
Grafana Dashboard
Node Exporter Metrics
cAdvisor Metrics
System Monitoring Dashboard
Outcome

Successfully implemented an end-to-end CI/CD pipeline using Jenkins and Docker.

Successfully automated Docker image creation and publishing to Docker Hub.

Successfully implemented automatic deployment to an AWS EC2 instance.

Successfully configured Prometheus for application and infrastructure monitoring.

Successfully integrated Grafana dashboards for real-time visualization.

Successfully monitored host resources using Node Exporter.

Successfully monitored Docker containers using cAdvisor.

Successfully implemented a complete DevOps workflow from code commit to production deployment with continuous monitoring.
