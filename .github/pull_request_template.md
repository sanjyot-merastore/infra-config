# 🚀 **Pull Request Summary**  

Provide a **clear and concise** summary of the changes. Explain **why** these modifications were made and reference any related issues.  

✅ **Fixes:** _(Issue #, if applicable)_  

---  

## 🛠 **Type of Change**  

- [ ] ⚙ **Infrastructure Configuration** – Updates to YAML, JSON, or environment configurations  
- [ ] 🏗 **Docker & Containers** – Changes to `Dockerfile`, `docker-compose.yml`, or container settings  
- [ ] 🗄 **Database & Migrations** – SQL scripts, schema updates, or database configuration changes  
- [ ] 🚀 **CI/CD & Deployment** – Adjustments to GitHub Actions, Terraform, or other deployment automation  
- [ ] 🔧 **Environment & Secrets Management** – Modifications to `.env`, Vault, or secrets storage  
- [ ] 🔄 **Refactor & Cleanup** – Improves structure without changing functionality  
- [ ] 📖 **Documentation Update** – Updates to `README.md`, usage guides, or infrastructure documentation  

---  

## 📜 **Commit Message Guidelines**  

🔹 **Write descriptive commit messages** – Clearly state **what** changed and **why**  
🔹 **Use a structured format** – Example:  
  - ✅ `infra: Update Elasticsearch index settings for logging`  
  - ✅ `docker: Optimize health checks in docker-compose`  
🔹 **Avoid mixing unrelated changes** in a single commit  

---  

## ✅ **Pre-Merge Checklist**  

### **📚 Documentation & Validation**  
- [ ] Updated **README, configuration references, or deployment guides**  
- [ ] Verified **Docker Compose or Kubernetes manifests** for correctness  
- [ ] Tested **SQL scripts against a local/test database**  

### **🔍 Best Practices & Quality Checks**  
- [ ] Ensured **YAML/JSON files are well-formed and validated**  
- [ ] Used **environment variables** instead of hardcoded values  
- [ ] Verified **backward compatibility** of configuration changes  

### **🛡 Security & Compliance**  
- [ ] No **hardcoded credentials, secrets, or tokens**  
- [ ] Ensured **least privilege access in IAM, DB, or service roles**  
- [ ] Verified **network security (firewall, ingress, CORS settings, etc.)**  

---  

## 🔍 **Reviewer Notes**  
💡 **_Reviewers: Please validate configurations and test where applicable before merging._**  
🚀 **Thanks for your contribution!** 🎉  
