# Azure Terraform Infracost FinOps CI

This repository demonstrates how to integrate **Terraform, Azure and Infracost** into CI pipelines to automatically estimate infrastructure costs and provide cost visibility directly in pull requests.

The project focuses on **DevOps / Platform Engineering practices** with a strong emphasis on **FinOps and cost-aware infrastructure design**.

---

## 🔍 What is this project?

A practical, production-inspired example of:

- Azure infrastructure defined with Terraform  
- automated cost estimation using Infracost  
- CI pipelines implemented in:
  - GitHub Actions  
  - Azure DevOps Pipelines  
- multiple infrastructure scenarios showing different cost profiles  

The goal is to make **cloud cost impact visible before deployment**, directly at pull request stage.

---

## ❗ Why this matters

In many real-world projects:

- infrastructure cost is not reviewed in pull requests  
- teams discover overspending only after receiving the Azure bill  
- architectural decisions are made without cost feedback  

This repository introduces a **FinOps feedback loop** into CI/CD:

> Pull request → Terraform plan → Cost estimation → Cost report

This enables teams to:

- detect expensive changes early  
- compare architectural options  
- build cost-aware engineering culture  

---

## 🧠 How it works

1. A pull request is created with Terraform changes  
2. CI pipeline runs:
   - `terraform init`
   - `terraform plan`
3. Infracost analyzes the plan and estimates monthly cost  
4. The pipeline publishes a cost report:
   - GitHub Actions → automatic PR comment  
   - Azure DevOps → pipeline logs / report  

No infrastructure is deployed.

---

## 🧪 Infrastructure scenarios

The repository contains multiple Terraform scenarios to demonstrate how design decisions affect cost.

| Scenario     | Description |
|---------------|-------------|
cheap           | Minimal dev/test setup with low monthly cost  
expensive       | Intentionally oversized architecture  
autoscaling     | Production-like setup with autoscaling  

Each scenario uses the same core modules but different SKUs and scaling settings.

---

## 🏗 Repository structure

