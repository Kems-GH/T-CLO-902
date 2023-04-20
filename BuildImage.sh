#!/bin/bash

# Variables pour l'authentification GitHub Packages
DOCKER_REGISTRY="docker.pkg.github.com"
OWNER="DarkKem"
REPO_NAME="T-CLO-902"
USERNAME="DarkKem"
TOKEN="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"

# Fonction pour authentifier auprès de GitHub Packages
function authenticate() {
  echo "Authentification auprès de GitHub Packages..."
  echo $TOKEN | docker login $DOCKER_REGISTRY -u $USERNAME --password-stdin
}

# Fonction pour builder et pousser une image Docker
function build_and_push_image() {

  # Récupérer les arguments
  IMAGE_NAME=$1
  DOCKERFILE=$2

  # Builder l'image Docker
  echo "Building $IMAGE_NAME image..."
  docker build -t $IMAGE_NAME $DOCKERFILE 

  # Tag l'image Docker pour GitHub Packages
  TAG=$DOCKER_REGISTRY/$OWNER/$REPO_NAME/$IMAGE_NAME:latest
  echo "Tagging $IMAGE_NAME image with $TAG..."
  docker tag $IMAGE_NAME $TAG

  # Pousser l'image Docker sur GitHub Packages
  echo "Pushing $IMAGE_NAME image to GitHub Packages..."
  docker push $TAG
}

# Authentifier auprès de GitHub Packages
authenticate

# Builder et pousser les images
build_and_push_image "indexer" "Programe/indexer/" 
build_and_push_image "reporting" "Programe/reporting/"
build_and_push_image "back" "Programe/back/"
build_and_push_image "front" "Programe/front/"
