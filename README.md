# T-CLO-902

## Build image
For build the image, you need to run the script : 
- `./BuildImage.sh` on Linux
- `BuildImage.ps1` on Windows (Powershell)

## Pull image

- `docker login docker.pkg.github.com -u USERNAME -p TOKEN`
- `docker pull docker.pkg.github.com/darkkem/t-clo-902/PACKAGE:latest`


# Helm 

## Commmands
### Chart
- `helm install -n NAMESPACE --name NAME CHART` : Install a chart
- `helm install NAME --values FILE CHART` : Install a chart with a values file
- `helm uninstall NAME` : Uninstall a chart
- `helm upgrade NAME CHART` : Upgrade a chart
- `helm delete NAME` : Delete a chart
- `helm list` : List all charts
- `helm status NAME` : Get the status of a chart
- `helm get values NAME` : Get the values of a chart
- `helm create NAME` : Create a chart
### Repo
- `helm repo add NAME URL` : Add a repo
- `helm repo update` : Update the repo
- `helm repo list` : List all repo