# Python App for AKS Deployment

## Prerequisites
- Azure CLI installed and logged in
- Docker installed
- kubectl installed
- ACR and AKS resources created

## Quick Deploy
1. Update variables in `deploy.sh`
2. Run: `chmod +x deploy.sh && ./deploy.sh`

## Manual Steps
```bash
# Build and push to ACR
az acr build --registry <acr-name> --image python-app:latest .

# Connect to AKS
az aks get-credentials --resource-group <rg> --name <aks-name>

# Deploy
kubectl apply -f deployment.yaml

# Check status
kubectl get pods
kubectl get service python-app-service
```