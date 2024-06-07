# Base image used 
FROM node:22-alpine3.19
WORKDIR /app
COPY package.json package-lock.json .
# Install project dependencies
RUN npm install --silent
EXPOSE 9000
# Run default command
CMD [ "npm", "run", "dev" ]