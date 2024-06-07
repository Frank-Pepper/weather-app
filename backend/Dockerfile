# Base image used 
FROM node:20.14.0-alpine
WORKDIR /app
COPY package.json .
# Install project dependencies
RUN npm install --silent
# Run default command
CMD ["npm", "start"]