FROM snyk/snyk:latest

RUN mkdir /project
COPY . /project
WORKDIR /project

RUN npm update
RUN npm install


