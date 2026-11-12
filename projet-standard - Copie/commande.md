# Commandes de demarrage du projet Arbiochem

Ce projet utilise Java 8, Ant, WildFly 10.1 et Oracle XE 11 dans Docker.

## 1. Aller dans le projet

```bash
cd "/home/armando/Documents/S5_S6/S5/Mr Tahina/Projet/S5/projet-standard - Copie"
```

## 2. Demarrer la base Oracle

Verifier l'etat du conteneur :

```bash
docker ps -a --filter name=arbiochem-oracle
```

Si le conteneur est arrete :

```bash
docker start arbiochem-oracle
```

Verifier que la base est prete :

```bash
docker logs --tail 40 arbiochem-oracle
```

Tester la connexion et le nombre de tables :

```bash
docker exec -i arbiochem-oracle sqlplus -s arbiochemstandard/arbiochemstandard@XE <<'SQL'
select count(*) as nombre_de_tables from user_tables;
exit
SQL
```

La base doit contenir environ 516 tables.

Arreter Oracle :

```bash
docker stop arbiochem-oracle
```

Redemarrer Oracle plus tard :

```bash
docker start arbiochem-oracle
```

Ne pas supprimer le conteneur avec `docker rm` : cela supprimerait la base du conteneur.

## 3. Configurer Java 8

A executer dans le terminal qui servira a compiler et a demarrer WildFly :

```bash
export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
java -version
javac -version
```

Les deux commandes doivent afficher une version Java 8.

## 4. Demarrer WildFly

Verifier que le port 8080 est libre :

```bash
sudo ss -ltnp | grep ':8080' || true
```

Si Tomcat occupe le port :

```bash
sudo systemctl stop tomcat10
sudo systemctl disable tomcat10
```

Demarrer WildFly et laisser ce terminal ouvert :

```bash
export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
/opt/wildfly/bin/standalone.sh -b 0.0.0.0
```

WildFly est disponible sur :

```text
http://localhost:8080
http://localhost:9990
```

Arreter WildFly depuis un autre terminal :

```bash
/opt/wildfly/bin/jboss-cli.sh --connect --command=":shutdown"
```

## 5. Compiler le projet

Dans un deuxieme terminal :

```bash
cd "/home/armando/Documents/S5_S6/S5/Mr Tahina/Projet/S5/projet-standard - Copie"
export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
ant -version
ant -f build-jenkins.xml
```

Le build cree le WAR dans :

```text
deployments/arbiochem.war
```

Le fichier `arbiochem-ejb/src/java/apj.properties` doit contenir la connexion locale :

```properties
apj.connection.url=jdbc:oracle:thin:@127.0.0.1:1521:XE
apj.connection.user=arbiochemstandard
apj.connection.password=arbiochemstandard
```

## 6. Deployer le WAR dans WildFly

Apres la compilation :

```bash
rm -rf /opt/wildfly/standalone/deployments/arbiochem.war
cp -a deployments/arbiochem.war /opt/wildfly/standalone/deployments/arbiochem.war
touch /opt/wildfly/standalone/deployments/arbiochem.war.dodeploy
```

Verifier le statut du deploiement :

```bash
ls -la /opt/wildfly/standalone/deployments
```

Le fichier attendu est :

```text
arbiochem.war.deployed
```

En cas d'erreur :

```bash
grep -iE 'ERROR|FAILED|WFLYCTL|arbiochem' /opt/wildfly/standalone/log/server.log | tail -100
```

## 7. Ouvrir l'application

```text
http://localhost:8080/arbiochem/
```

Compte applicatif de test restaure :

```text
Identifiant : admin
Mot de passe : paop
```

Ces identifiants ne sont pas les identifiants Oracle. Le compte Oracle est utilise uniquement par l'application pour se connecter a la base.

## 8. Arret complet

Arreter l'application WildFly :

```bash
/opt/wildfly/bin/jboss-cli.sh --connect --command=":shutdown"
```

Arreter Oracle :

```bash
docker stop arbiochem-oracle
```

## 9. Demarrage complet rapide

Terminal 1 :

```bash
docker start arbiochem-oracle
```

Terminal 2 :

```bash
export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
/opt/wildfly/bin/standalone.sh -b 0.0.0.0
```

Terminal 3 :

```bash
cd "/home/armando/Documents/S5_S6/S5/Mr Tahina/Projet/akoho/projet-standard - Copie"
export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"
ant -f build-jenkins.xml
rm -rf /opt/wildfly/standalone/deployments/arbiochem.war
cp -a deployments/arbiochem.war /opt/wildfly/standalone/deployments/arbiochem.war
touch /opt/wildfly/standalone/deployments/arbiochem.war.dodeploy
```
docker start arbiochem-oracle

export JAVA_HOME=/usr/lib/jvm/temurin-8-jdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"

/opt/wildfly/bin/standalone.sh -b 0.0.0.0