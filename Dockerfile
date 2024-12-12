FROM openjdk:11

# Déclarez le port sur lequel votre application écoute
EXPOSE 8085

# Définir le répertoire de travail
WORKDIR /app

# Installer curl pour télécharger le fichier JAR
RUN apt-get update && apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*

# Télécharger le fichier JAR depuis Nexus
RUN curl -f -o events-1.0.0.jar -L "http://192.168.43.12/:8081/repository/maven-releases/tn/esprit/spring/events/1.0.0/events-1.0.0.jar"

# Commande d'entrée pour exécuter l'application
ENTRYPOINT ["java", "-jar", "events.jar"]