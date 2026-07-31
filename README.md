DevOps CI/CD Pipeline with Monitoring

Project: End-to-End CI/CD Pipeline with Docker, Jenkins, GitHub, Docker Hub, Prometheus and Grafana

Table of Contents
Project Overview
Architecture
Technology Stack
Infrastructure
Project Repository
Docker Configuration
Continuous Integration (CI)
Continuous Deployment (CD)
Monitoring Setup
Application Deployment Workflow
Verification Steps
Project Outcome
Conclusion
1. Project Overview

This project demonstrates a complete DevOps CI/CD pipeline for deploying a Dockerized web application on AWS EC2 using Jenkins. The pipeline automatically builds Docker images, pushes them to Docker Hub, deploys the latest version to the application server, and continuously monitors the infrastructure and application using Prometheus, Grafana, Node Exporter, and cAdvisor.

The project follows modern DevOps practices by automating software delivery and infrastructure monitoring.

2. Architecture
                    GitHub Repository
                           │
                           │ Webhook
                           ▼
                    Jenkins Server
                           │
                 Build Docker Image
                           │
                           ▼
                    Docker Hub Registry
                           │
                    Pull Latest Image
                           ▼
                  Application EC2 Server
                           │
        ┌──────────────────┴──────────────────┐
        │                                     │
   Docker Container                    Monitoring Stack
        │                                     │
        ▼                                     ▼
  Static Web Application      Prometheus + Grafana
                               │
                    ┌──────────┴──────────┐
                    │                     │
             Node Exporter          cAdvisor
3. Technology Stack
Component	Technology
Source Control	GitHub
CI/CD Tool	Jenkins
Containerization	Docker
Container Registry	Docker Hub
Cloud Platform	AWS EC2
Web Server	Nginx
Monitoring	Prometheus
Dashboard	Grafana
Host Metrics	Node Exporter
Container Metrics	cAdvisor
Operating System	Ubuntu Server
4. Infrastructure
Jenkins Server

Responsibilities

Pull source code from GitHub
Build Docker image
Push Docker image to Docker Hub
Connect to Application Server
Deploy latest application container
Application Server

Responsibilities

Pull Docker image
Run application container
Host Prometheus
Host Grafana
Host cAdvisor
Run Node Exporter service
5. Project Repository

Repository Structure

devops-build/
│
├── build/
│
├── Dockerfile
│
├── docker-compose.yml
│
├── build.sh
│
├── deploy.sh
│
└── README.md
6. Docker Configuration

The application is packaged inside a lightweight Nginx container.

Dockerfile

FROM nginx:alpine

COPY build/ /usr/share/nginx/html

EXPOSE 80

CMD ["nginx","-g","daemon off;"]
7. Continuous Integration (CI)

The CI pipeline performs the following tasks automatically.

Source Code Checkout

Jenkins receives a GitHub webhook whenever code is pushed.

Repository is cloned automatically.

Docker Image Build

Docker builds a new application image.

Example

docker build -t harikrishna2125/devops-build-prod:latest .
Docker Hub Authentication

Jenkins authenticates using stored credentials.

Docker Push

Latest image is pushed to Docker Hub.

Example

docker push harikrishna2125/devops-build-prod:latest
8. Continuous Deployment (CD)

Deployment is performed automatically after a successful build.

Deployment steps

Connect to Application Server
Pull latest Docker image
docker pull harikrishna2125/devops-build-prod:latest
Stop running container
docker stop devops-app
Remove old container
docker rm devops-app
Start new container
docker run -d \
--name devops-app \
-p 80:80 \
--restart unless-stopped \
harikrishna2125/devops-build-prod:latest

The latest version of the application becomes available immediately after deployment.

9. Monitoring Setup
Prometheus

Prometheus continuously collects metrics from monitored targets.

Configured scrape targets

Prometheus
Node Exporter
cAdvisor

Scrape interval

15 Seconds
Node Exporter

Node Exporter provides operating system metrics.

Collected metrics include

CPU Usage
Memory Usage
Disk Usage
Network Usage
Load Average
Filesystem Statistics
cAdvisor

cAdvisor collects Docker container metrics.

Collected metrics include

Container CPU Usage
Container Memory Usage
Container Network Traffic
Filesystem Usage
Container Status
Running Containers
Grafana

Grafana visualizes all collected metrics.

Dashboards display

CPU Utilization
Memory Consumption
Disk Usage
Network Throughput
Docker Container Statistics
Host Performance
10. Application Deployment Workflow
Developer

        │

        ▼

GitHub Push

        │

        ▼

GitHub Webhook

        │

        ▼

Jenkins Pipeline

        │

        ▼

Docker Build

        │

        ▼

Docker Hub

        │

        ▼

Application EC2

        │

        ▼

Docker Container Updated

        │

        ▼

Prometheus Scrapes Metrics

        │

        ▼

Grafana Displays Dashboard
11. Verification Steps

The project was validated using the following checks.

CI Validation
Repository checkout successful
Docker image built successfully
Docker image pushed successfully
CD Validation
Latest image pulled successfully
Old container removed
New container started
Application accessible through browser
Monitoring Validation

Prometheus

Prometheus target healthy
Node Exporter target healthy
cAdvisor target healthy

Grafana

Connected to Prometheus
Dashboards displaying metrics successfully
12. Project Outcome

The completed solution provides

Fully automated CI/CD pipeline
Containerized application deployment
Zero manual deployment steps
Docker image version management
Infrastructure monitoring
Container monitoring
Real-time dashboards
Automated application updates
13. Conclusion

This project successfully demonstrates an end-to-end DevOps implementation using GitHub, Jenkins, Docker, Docker Hub, AWS EC2, Prometheus, Grafana, Node Exporter, and cAdvisor.

The pipeline automates the complete software delivery lifecycle, from source code changes to production deployment, while continuously monitoring both the application container and the underlying server infrastructure. The solution showcases modern DevOps practices, including Continuous Integration, Continuous Deployment, Infrastructure Monitoring, and Container Monitoring, resulting in a reliable, scalable, and automated deployment workflow.
