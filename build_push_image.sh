#!/bin/bash

# Membuat Docker image dari Dockerfile yang telah dibuat, dengan nama image item-app, dan memiliki tag v1.
docker build -t item-app:v1 .

# Melihat daftar image di lokal.
docker images

# Mengubah nama image agar sesuai dengan format Github Packages
docker tag item-app:v1 ghcr.io/arifardia/item-app:v1

# Login ke Github Packages dengan access token yang disimpan di variabel $CR_PAT
echo $CR_PAT | docker login ghcr.io -u arifardia --password-stdin

# Mengunggah image ke Github Packages
docker push ghcr.io/arifardia/item-app:v1
