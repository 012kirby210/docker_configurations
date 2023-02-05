# Configuration docker par branches :
- apache + php 8

## Principe : 
 - Cloner le repo
 - Construire les images 
 - Utiliser les images dans les compositions
 - Exploiter les services

### Utiliser mkcert pour la construction et la configuration du certif ssl : 
https://github.com/FiloSottile/mkcert
Les fichiers pem cert et clef sont à placer dans le répertoire ssl à la racine du repo.

### Construction des images 
```sh
docker build . -t <nom_image>

```
