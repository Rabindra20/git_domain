FROM node:14

WORKDIR /usr/src/app
# RUN apt-get update 
# RUN useradd -m rab
# USER rab
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
CMD [ "npm" , "start" ]
