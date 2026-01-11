Bienvenue dans mon ~~auberge~~ arrière-garage :)
Comme vous le constaterez, le set-up pour avoir un pseudo-hang.fm est encore très très bricolé et peu testé, soyez indulgents et lisez attentivement la documentation !

<!-- TOC -->

## A propos de l'authentication
Quand vous vous connecterez à un des services sur hugowillaume.com, vous aurez un prompt d'authentication Google.

Utiliser son compte avec l'addresse en ***sloclap.com*** pour se connecter (ou me ping en cas de besoin de rajout d'une exception !)

## Ecouter de la musique

On va commencer par se connecter sur le serveur d'écoute. Celui-ci servira juste à turn on-off la musique et ajuster le volume.

Pour l'instant c'est pas mal de bricole, ***suivez bien les instructions svp ***


1. Se rendre sur [Mopidy-Iris](https://player.hang.hugowillaume.com/iris).
2. Renseigner son username sur la page d'accueil de Iris (et vous pouvez désactiver les statistiques d'utilisation si ça vous chante)
3. Se rendre dans les Settings (en bas de la Sidebar à gauche)
4. Dans la partie "Services", cliquer sur Snapcast
5. Cocher "Enabled"
6. Mettre dans le champ "Host": `snap.hang.hugowillaume.com`
7. Mettre dans le champ "Port": `443`
8. Cocher "Use SSL"
9. Ensuite, ***dans la play-bar en bas de l'écran*** appuyer sur la petite icône d'enceinte à côté du volume, et cocher "Stream on this device"
10. De retour à la partie "snapcast" des Settings, un nouveau Groupe devrait avoir apparu, avec un nom similaire à "b6e", "a2c", etc. ***Cliquer sur ce groupe***
11. Renommer les 2 champs "Name" avec votre username, pour éviter la confusion avec le volume des autres utilisateurs.

### IMPORTANT POUR L'USAGE DE IRIS
- Le volume accessible directement en bas à droite est partagé chez tout le monde. Utilisez la molette de volume à votre nom qu'on vient de créer ensemble SVP !
- Merci aussi de ne pas broyer les oreilles des autres en touchant à leur volume, ce serait vraiment pas cool (maintenant vous comprenez pourquoi je limite l'accès aux addresses en sloclap.com)

## Ajouter sa musique à la file d'attente
Pour ça, on va utiliser un autre service. ***Laissez la 1ère fenêtre ouverte***, c'est elle qui gère le son.

1. Se rendre sur [Mopidy-Party](https://player.hang.hugowillaume.com/party).
2. Chercher la musique de son choix.
3. Appuyer sur Play pour mettre la musique dans la file d'attente.

C'est un tantinet plus moche que Iris, mais faut admettre que c'est aussi largement moins compliqué d'usage.

Si vous avez pas trouvé votre musique (trèèèès probable)

## Rajouter de la musique sur le serveur

Contrairement à hang.fm, j'ai pas de contrat d'usage avec Spotify pour la musique, mais par contre j'ai un serveur avec 500G de stockage :D

Vous pourrez donc tranquillement exporter vos quantités de .mp3 à la main via SFTP, ou ajouter quelques tracks rapidement via un serveur de DL


## SFTP
1. Se rendre sur [mon serveur SFTP](https://sftp.hang.hugowillaume.com/web/client/login)
2. Se connecter avec le user `user` et le password `password` (oui bah j'ai pas su désactiver l'authentication sur le SFTP) 
3. Bah vous y êtes, y'a toute la musique sur le serveur ici, vous pouvez vous servir & en rajouter

### Export de playlist youtube
Allez sur [metube](https://youtube.hang.hugowillaume.com/), mettez votre vidéo/playlist, et c'est parti !
### Export de playlist spotify
Vous pouvez aller sur [downtify](https://spotify.hang.hugowillaume.com/download), rentrer l'URL de votre musique/album/playlist préférée, et regarder la magie se faire :)

- Je dérecommande fortement le fait de tenter d'importer + qu'une 30aine, c'est un coup à faire planter le service. (true story, j'ai limit-testé.)
- Soyez patients avec l'UI ! Si vous triple-cliquez un truc, il va juste se mettre 3 fois dans la file, et là on va ramer aussi

Plus tard, je rendrais aussi possible le fait de crop un fichier particulier pour le cas des exports foireux qui rajoutent des intros/outros pas nécessaires.
