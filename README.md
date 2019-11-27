# ACOrN
ACOrN is a tool that is being used by Ordina for analyzing Archimate repositories.

If you want to deploy it, use
```
   .../git/ACOrN> docker-compose up -d
```
This deploys the ACOrN service on your docker-platform using the file ``docker-compose.yml``. Docker will pull the most recent ACOrN-image from Docker Hub and spin up the application. When this is done, browse (preferrably in Chrome or Firefox) to http://localhost/ACOrN to see it work.

To build a docker-image of ACOrN yourself, open a command line interface, clone the ACOrN repository (if you haven't already), go to the root directory of ACOrN and give the following command:
```
   .../git/ACOrN> docker build --tag ampersandtarski/ACOrN:latest .
```

