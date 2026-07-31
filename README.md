# DevOps CI/CD Pipeline using Jenkins, Docker, Docker Hub, Prometheus and Grafana

Jenkins CI/CD pipeline screenshots, Docker deployment screenshots, Prometheus monitoring screenshots, Grafana dashboards, Node Exporter metrics, cAdvisor metrics and application deployment screenshots have been added in the **Screenshots** folder.

## Project Overview

This project demonstrates an end-to-end DevOps CI/CD pipeline for deploying a Dockerized web application using Jenkins. The application source code is maintained in GitHub, Docker images are built and pushed to Docker Hub, and the latest application is automatically deployed to an AWS EC2 instance.

Infrastructure and application monitoring are implemented using Prometheus, Grafana, Node Exporter and cAdvisor to provide real-time monitoring of both the host machine and Docker containers.

The project automates the complete software delivery lifecycle from source code commit to production deployment and monitoring.

---

## Technologies Used

- HTML
- CSS
- JavaScript
- Nginx
- Docker
- Docker Hub
- Jenkins
- Git
- GitHub
- AWS EC2
- Prometheus
- Grafana
- Node Exporter
- cAdvisor

---

## Repository

GitHub Repository

https://github.com/harikrishna0015/devops-build

Docker Hub Repository

```
harikrishna2125/devops-build-prod
```

---

## Project Structure

```text
devops-build/
├── Screenshots/
├── build/
├── Dockerfile
├── Jenkinsfile
├── build.sh
├── deploy.sh
├── docker-compose.yml
├── prometheus.yml
├── README.md
└── .dockerignore
```

---

## Prerequisites

- AWS Account
- Ubuntu EC2 Instances
- Docker
- Docker Hub
- Jenkins
- Git
- GitHub
- Prometheus
- Grafana
- Node Exporter
- cAdvisor

---

# Docker

## Build Docker Image

```bash
docker build -t harikrishna2125/devops-build-prod:latest .
```

## Verify Docker Image

```bash
docker images
```

## Run Docker Container

```bash
docker run -d \
--name devops-app \
-p 80:80 \
harikrishna2125/devops-build-prod:latest
```

---

# Docker Hub

Docker image is automatically pushed to Docker Hub.

Repository

```
harikrishna2125/devops-build-prod
```

## Login

```bash
docker login
```

## Push Docker Image

```bash
docker push harikrishna2125/devops-build-prod:latest
```

---

# Jenkins CI/CD Pipeline

A Declarative Jenkins Pipeline was created to automate the deployment process.

Pipeline stages include:

1. Source Code Checkout
2. Docker Image Build
3. Docker Image Push to Docker Hub
4. Deploy Application to EC2
5. Deployment Verification

---

# Continuous Deployment

After a successful Jenkins build, the latest Docker image is deployed automatically to the Application EC2 instance.

## Pull Latest Image

```bash
docker pull harikrishna2125/devops-build-prod:latest
```

## Stop Existing Container

```bash
docker stop devops-app
```

## Remove Existing Container

```bash
docker rm devops-app
```

## Deploy Latest Container

```bash
docker run -d \
--name devops-app \
-p 80:80 \
--restart unless-stopped \
harikrishna2125/devops-build-prod:latest
```

---

# Monitoring

Monitoring was implemented using

- Prometheus
- Grafana
- Node Exporter
- cAdvisor

---

## Prometheus

Prometheus collects metrics from the application server and Docker containers.

Configured scrape targets include:

- Prometheus
- Node Exporter
- cAdvisor

Start Prometheus

```bash
docker run -d \
--name prometheus \
-p 9090:9090 \
-v $(pwd)/prometheus.yml:/etc/prometheus/prometheus.yml \
prom/prometheus
```

---

## Node Exporter

Node Exporter collects host-level metrics.

Collected metrics include:

- CPU Usage
- Memory Usage
- Disk Usage
- Network Usage
- Filesystem Usage
- System Load

---

## cAdvisor

cAdvisor collects Docker container metrics.

Collected metrics include:

- Container CPU Usage
- Container Memory Usage
- Container Network Usage
- Filesystem Usage
- Running Containers

Start cAdvisor

```bash
docker run -d \
--name cadvisor \
-p 8080:8080 \
-v /:/rootfs:ro \
-v /var/run:/var/run:ro \
-v /sys:/sys:ro \
-v /var/lib/docker:/var/lib/docker:ro \
gcr.io/cadvisor/cadvisor:latest
```

---

## Grafana

Grafana provides real-time dashboards for all collected metrics.

Dashboards include:

- Prometheus Dashboard
- Host Monitoring Dashboard
- Docker Container Monitoring
- CPU Utilization
- Memory Utilization
- Disk Usage
- Network Usage

Start Grafana

```bash
docker run -d \
--name grafana \
-p 3000:3000 \
grafana/grafana
```

---

# Verification

Verify Docker Containers

```bash
docker ps
```

Verify Docker Images

```bash
docker images
```

Verify Prometheus Targets

```bash
http://<Application-EC2-IP>:9090/targets
```

Verify Grafana Dashboard

```bash
http://<Application-EC2-IP>:3000
```

Verify Application

```bash
http://<Application-EC2-IP>
```

---

# Application Access

The application is accessible through the public IP address of the Application EC2 instance.

Prometheus provides infrastructure metrics.

Grafana provides dashboards for monitoring the server and Docker containers.

Please refer to the screenshots available in the **Screenshots** folder.

---

# Screenshots Included

Please refer to the **Screenshots** folder.

---

# Outcome

Successfully implemented an end-to-end CI/CD pipeline using Jenkins.

Successfully containerized the web application using Docker.

Successfully pushed Docker images to Docker Hub.

Successfully automated deployment to an AWS EC2 instance.

Successfully configured Prometheus for monitoring.

Successfully integrated Grafana dashboards.

Successfully monitored host metrics using Node Exporter.

Successfully monitored Docker containers using cAdvisor.

Successfully implemented a complete DevOps workflow from source code commit to automated deployment and infrastructure monitoring.
