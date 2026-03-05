# Create service account

gcloud iam service-accounts create homelab-service-account \
  --description="Terraform service account for homelab projects" \
  --display-name="homelab-service-account"

# Grant service account permissions

gc_project=$(gcloud config get-value project)

gcloud projects add-iam-policy-binding $gc_project \
  --member="serviceAccount:homelab-service-account@$gc_project.iam.gserviceaccount.com" \
  --role="roles/compute.admin"

# Optionally, for broader infra management:
gcloud projects add-iam-policy-binding $gc_project \
  --member="serviceAccount:homelab-service-account@$gc_project.iam.gserviceaccount.com" \
  --role="roles/editor"
