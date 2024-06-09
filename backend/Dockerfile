# Base image used 
FROM node:22-alpine3.19
WORKDIR /app
COPY package.json package-lock.json .
# Install project dependencies
RUN npm install --silent
# Node module to get weather api key
RUN npm install dotenv --save
EXPOSE 9000
# Run default command
CMD [ "npm", "run", "dev" ]