#!/bin/bash

# Variables - Update these with your values
RESOURCE_GROUP="your-resource-group"
ACR_NAME="your-acr-name"
AKS_NAME="your-aks-cluster"
IMAGE_NAME="python-app"

# Build and push to ACR
az acr build --registry $ACR_NAME --image $IMAGE_NAME:latest .

# Get AKS credentials
az aks get-credentials --resource-group $RESOURCE_GROUP --name $AKS_NAME

# Update deployment with ACR image
sed -i "s/<your-acr-name>/$ACR_NAME/g" deployment.yaml

# Deploy to AKS
kubectl apply -f deployment.yaml

# Get service external IP
kubectl get service python-app-service