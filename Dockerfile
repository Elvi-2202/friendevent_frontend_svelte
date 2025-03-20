# Utiliser une image de base avec Node.js
FROM node:18-slim

# Installer les dépendances pour Jest et autres outils nécessaires
RUN apt-get update && apt-get install -y \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/*

# Installer Jest globalement
RUN npm install -g jest

# Créer un répertoire de travail
WORKDIR /workspace

# Copier le package.json et le package-lock.json dans l'image
COPY package*.json ./

# Installer les dépendances du projet
RUN npm install

# Installer d'autres outils de développement si nécessaire (par exemple, pour Svelte)
RUN npm install -g svelte

# Copier le code du projet dans l'image
COPY . .

# Exposer le port Jenkins (optionnel, dépend de l'environnement)
EXPOSE 8080

# Lancer Jenkins agent
CMD ["sh", "-c", "tail -f /dev/null"]
