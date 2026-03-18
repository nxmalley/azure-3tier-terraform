# 3-Tier Secure Cloud Architecture (Azure & Terraform)

##  Project Summary

Designed and partially implemented a secure 3-tier cloud architecture in Azure using Terraform, applying zero-trust networking, least-privilege access, and infrastructure-as-code principles to simulate a production-grade environment.

---

##  Architecture Overview

* **Web Tier (Public):** Controlled internet-facing entry point
* **Application Tier (Private):** Backend logic, no public access
* **Database Tier (Private):** Highly restricted data layer
* **Management Tier:** Bastion/jump host for secure administrative access

---

##  Key Security Principles

* Zero Trust: No implicit trust between tiers
* Least Privilege: Strict NSG rules controlling all traffic
* No Public Exposure: App and DB tiers isolated in private subnets
* Secure Access: SSH via hardened jump box only

---

##  Technologies Used

* Microsoft Azure
* Terraform (Infrastructure as Code)
* Azure Virtual Network (VNet)
* Subnets & CIDR segmentation
* Network Security Groups (NSGs)
* Linux Virtual Machines
* SSH Key Authentication

---

##  Network Design

* VNet: `10.0.0.0/16`
* Web Subnet: `10.0.1.0/24`
* App Subnet: `10.0.2.0/24`
* DB Subnet: `10.0.3.0/24`
* Mgmt Subnet: `10.0.4.0/24`

**Traffic Flow:**

* Internet → Web Tier (HTTP/HTTPS only)
* Web Tier → App Tier
* App Tier → Database Tier
* Admin Access → Jump Box → Private Resources

---

##  Infrastructure Design

* Modular Terraform architecture (network, NSG, compute)
* Remote authentication via Azure CLI (no credentials in code)
* SSH key-based access for all VMs
* Bastion host as the only public administrative entry point

---

##  Project Structure

```
infra/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── modules/
    ├── resource_group/
    ├── network/
    ├── nsg/
    ├── jumpbox/
    └── web_tier/
```

---

##  Key Outcomes

* Implemented segmented Azure network with tier isolation
* Enforced secure access via bastion host and SSH keys
* Applied Infrastructure as Code for repeatable deployments
* Designed NSG rules to control east-west and north-south traffic

---

##  Challenges & Lessons Learned

* Azure free-tier and vCPU quota limitations impacted VM deployment
* Region/SKU availability constraints required redesign and troubleshooting
* Terraform state conflicts and subscription switching required debugging
* Reinforced importance of cost planning and resource constraints in cloud design 

---

##  Future Improvements

* Complete full 3-tier deployment (App + DB tiers)
* Add load balancer for web tier
* Integrate Azure Key Vault for secrets management
* Implement monitoring (Azure Monitor / Log Analytics)
* Add CI/CD pipeline for Terraform deployments

---

##  Author

Nicholas Malley
Aspiring Cloud Engineer | Cybersecurity Background
