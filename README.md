

````markdown
# 🚀 DevOps Task 4: Infrastructure as Code (IaC) with Terraform :-

## 🧩 Objective
The objective of this task is to **provision a local Docker container using Terraform**, demonstrating how Infrastructure as Code (IaC) can automate environment setup efficiently.

---

## 🧰 Tools & Technologies :
- **Terraform**
- **Docker**
- **VS Code / Terminal**

---

## 🏗️ Project Overview
In this project, Terraform is used to:
1. Pull the latest **Nginx** Docker image.
2. Create and run a **Docker container** using that image.
3. Manage the lifecycle of the container with Terraform commands (`apply`, `destroy`, etc.).

This demonstrates **Infrastructure as Code (IaC)** — where infrastructure is defined, provisioned, and managed through code.

---

## 📂 Files in This Repository
| File | Description |
|------|--------------|
| `main.tf` | Terraform configuration file that defines the Docker provider, image, and container resources. |
| `README.md` | Documentation explaining the task and steps. |
| `screenshots/` | Folder containing screenshots of successful Terraform commands and Docker container. |

---

## ⚙️ Terraform Configuration (`main.tf`)
```hcl
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pull latest NGINX image
resource "docker_image" "nginx_image" {
  name         = "nginx:latest"
  keep_locally = false
}

# Create and run a Docker container
resource "docker_container" "nginx_container" {
  name  = "nginx-container"
  image = docker_image.nginx_image.latest
  ports {
    internal = 80
    external = 8080
  }
}
````

---

## 🧠 Steps to Run

### 1️⃣ Initialize Terraform

```bash
terraform init
```

### 2️⃣ Preview the Changes

```bash
terraform plan
```

### 3️⃣ Apply the Configuration

```bash
terraform apply -auto-approve
```

✅ Check running containers:

```bash
docker ps
```

Visit **[http://localhost:8080](http://localhost:8080)** in your browser — you should see the **NGINX welcome page**.

### 4️⃣ Check Terraform State

```bash
terraform state list
```

### 5️⃣ Destroy Infrastructure

```bash
terraform destroy -auto-approve
```

---

## 📸 Screenshots (Example)

* Terraform `init`, `plan`, `apply` output
* Running container visible via `docker ps`
* Browser view at `localhost:8080`
* Terraform `destroy` output

---




## 🧩 Key Learnings

* Understanding of **Infrastructure as Code (IaC)**.
* How **Terraform** provisions and manages **Docker containers**.
* How to use Terraform commands (`init`, `plan`, `apply`, `destroy`, `state`).
* Concept of **Terraform state** and **providers**.



```


