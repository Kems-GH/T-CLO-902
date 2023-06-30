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


## Chart used
Use kubernetes version 1.24.0
- `helm repo add elastic https://helm.elastic.co`
- `helm install my-elasticsearch --values ./elasticsearch/values.yaml elastic/elasticsearch --version 7.10.2`
- `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm install mysql --values ./mysql/values.yaml bitnami/mysql --version 9.10.4`
- `helm install rabbitmq --values ./rabbitmq/values.yaml bitnami/rabbitmq --version 12.0.3`
- `helm repo add prometheus-community https://prometheus-community.github.io/helm-charts`
- `helm repo add grafana https://grafana.github.io/helm-charts`
- `helm install grafana grafana/grafana`
- `helm install prometheus prometheus-community/prometheus -f values.yaml` Mettre le bon path pour le fichier values.yaml

### Ajouter Grafana et Prometheus pour le monitoring
- `kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}"` Récupérer le password admin de Grafana en base64, changer le namespace si besoin
- Dans Grafana, il faut ajouter le datasource de Prometheus avec cette url http://prometheus-server
- Pour finir ajouter un dashboard avec l'ID 1860 utilisant le datasource précédent
