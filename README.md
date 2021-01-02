# DockVuln
This repository hosts files for images which contain **VULNERABLE** machines.
The vulnerabilities will depend on the service downloaded. The general process
is as follows:
1. Find vulnerable service on internet (usually ExploitDB)
2. Create environment within Docker container (create DOCKERFILE)
3. Generate and upload image to DockerHub

These images will also have a flag where the image should be exploitable (ie. if
the idea is to get root, there will be a flag in /root/Desktop, if in a
database, the flag will be in the database).

## How To Use
Soon to come...
