# Define the base directory
$BASE_DIR = "infra-config"

# Create the base directoryNew-Item -ItemType Directory -Force -Path $BASE_DIR

# Define the folder structure
$dirs = @(
    "docker-compose",
    "terraform",
    "kubernetes/deployments",
    "kubernetes/services",
    "kubernetes/configmaps",
    "kubernetes/secrets",
    "cicd/jenkins",
    "cicd/github-actions",
    "cicd/gitlab-ci",
    "logging-monitoring/elk/elasticsearch",
    "logging-monitoring/elk/logstash",
    "logging-monitoring/elk/kibana",
    "logging-monitoring/prometheus",
    "logging-monitoring/grafana",
    "security/iam-policies",
    "security/network-policies",
    "security/ssl",
    "backups/backup-scripts",
    "shared-libs/common-scripts",
    "docs/architecture-diagrams"
)

# Create directories
foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path "$dir"
}

# Create placeholder files
New-Item -ItemType File -Force -Path "$.env"
New-Item -ItemType File -Force -Path "$docs\setup-instructions.md"
New-Item -ItemType File -Force -Path "$docs\best-practices.md"

Write-Host "Folder structure created successfully."
