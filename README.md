
Yakasserole BDD
===


# **Installation**

La procédure d'installation et de configuration de PostgreSQL utilise Docker. Il faut donc installer les dépendances suivantes :

## Prérequis

### Docker
Suivez les consignes d'installation de Docker: [https://docs.docker.com/engine/installation/](https://docs.docker.com/engine/installation/).

### Docker Compose
Suivez les consignes d'installation de docker-compose: [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/).


# **Utilisation**

Voici la procédure afin d'installer le serveur PostgreSQL:

## Cloner le dépot 
```sh
# Cloner le dépot
git clone https://Bensabat@gitlab.com/Bensabat/docker-postgres.git

# Se déplacer dans le répertoire
cd docker-postgres
```

## Configuration
Il est possible de modifier les configurations de la base de données en éditant le fichier docker-compose.yml.

Par exemple pour modifier le mot de passe, il suffit de remplacer les variables d'environement *POSTGRES_PASSWORD*, *POSTGRES_USER* et *POSTGRES_DB*:

```yaml
postgres:
	...
	environment:
	    POSTGRES_USER: yakasserole
	    POSTGRES_PASSWORD: F8Pf7tM
	    POSTGRES_DB: app
	...
```

## Exécuter
Afin de lancer le serveur PostgreSQL, exécutez la commande suivante:

```sh
docker-compose up -d
```

## Arrêter le serveur
Afin d'arrêter le serveur PostgreSQL, exécutez la commande suivante:

```sh
docker-compose down
```

# **Accéder aux données**

## Graphiquement

Il est possible de visualiser les données de la base en utilisant l'interface graphique *PgAdmin* disponible à l'url [http://localhost:5050](http://localhost:5050).

## Par le code

Par exemple avec *Node.js*, en utilisant le paquet *pg* ([https://github.com/brianc/node-postgres](https://github.com/brianc/node-postgres)), voici le fichier de configuration:

```js
var config = {
  user: 'yakasserole', // POSTGRES_USER
  database: 'app', // POSTGRES_DB
  password: 'F8Pf7tM', // POSTGRES_PASSWORD
  host: 'localhost', // localhost
  port: 5432, // port par défaut
  
  ...
};
```
