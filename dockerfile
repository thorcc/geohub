# Velger Node.js som base image
FROM node:14

# Installerer Git
RUN apt-get update && \
    apt-get install -y git

# Setter arbeidskatalogen i containeren
WORKDIR /app

# Kloner kildekoden fra GitHub-repositoriet
RUN git clone https://github.com/benlikescode/geohub.git /app

# Installerer prosjektets avhengigheter
RUN yarn install

# Bygger applikasjonen
RUN yarn build

# Åpner port 3000
EXPOSE 3000

# Starter applikasjonen
CMD ["yarn", "start"]
