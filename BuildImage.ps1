# Variables pour l'authentification GitHub Packages
$DOCKER_REGISTRY = "docker.pkg.github.com"
$OWNER = "darkkem"
$REPO_NAME = "t-clo-902"
$USERNAME = "DarkKem"
$TOKEN = "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"

# Fonction pour authentifier auprès de GitHub Packages
function Authenticate() {
  Write-Output "Authentification auprès de GitHub Packages..."
  $TOKEN | docker login $DOCKER_REGISTRY -u $USERNAME --password-stdin
}

# Fonction pour builder et pousser une image Docker
function BuildAndPushImage($imageName, $dockerfile) {
  # Builder l'image Docker
  Write-Output "Building $imageName image..."
  docker build -t $imageName $dockerfile

  # Tag l'image Docker pour GitHub Packages
  $tag = "$DOCKER_REGISTRY/$OWNER/$REPO_NAME/$imageName" + ":latest"
  Write-Output "Tagging $imageName image with $tag..."
  docker tag $imageName $tag

  # Pousser l'image Docker sur GitHub Packages
  Write-Output "Pushing $imageName image to GitHub Packages..."
  docker push $tag
}

# Authentifier auprès de GitHub Packages
Authenticate

# Builder et pousser les images
# BuildAndPushImage "indexer" "Programe/indexer/" 
# BuildAndPushImage "reporting" "Programe/reporting/"
BuildAndPushImage "back" "Programe/back/"
# BuildAndPushImage "front" "Programe/front/"