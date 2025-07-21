``` 
               _  _____ ____ ____                        _   _      ____  _  ______
              | |/ /_ _/ ___/ ___| _ __ ___   __ _ _   _| |_(_) ___|  _ \| |/ /  _ \ 
              | ' / | |\___ \___ \| '_ ` _ \ / _` | | | | __| |/ __| | | | ' /| |_) |
              | . \ | | ___) |__) | | | | | | (_| | |_| | |_| | (__| |_| | . \|  _ < 
              |_|\_\___|____/____/|_| |_| |_|\__,_|\__,_|\__|_|\___|____/|_|\_\_| \_\

```
# Pull & Play, very verbose, KISS Dockerfiles for Mautic

All in one, batteries included, single-container implementation of a full Mautic server.

"Latest" currently includes:
- Debian 12-slim
- Mariadb 11.4 LTS
- Apache 2.4
- PHP 8.3-FPM
- Mautic 5.2.6 and Mautic 6.0.2

Follows KISS principles from the perspective of the person deploying the container, which increases the complexity of the Dockerfile itself. The Dockerfile is extremely verbose and not optimized for speed/size, this is intentional, so anyone can easily modify it.

Here is the GitHub repo with the Dockerfile and other scripts used to build the image:
- https://github.com/Martech-WorkShop/KISSMauticDKR

It also uses configuration files and scripts from the toolBelt, found at: https://github.com/Martech-WorkShop/toolBelt⁠martech.ws⁠
Martech-WorkShop Check the blog for articles and news: https://martech.ws
⁠as well as the Martech WorkShop YouTube channel: https://www.youtube.com
@MartechWorkShop⁠ ⁠ github@martech.ws
https://martech.ws
X: ⁠@MartechWorkShop
https://mauteam.org
⁠https://mktg.dev⁠⁠

This Dockerfile concentrates on simplicity and convenience for the person deploying the image,
as well as clarity and verboseness for those wanting to understand what is going in the container.

This adds quite a lot of complexity on the dockerfile itself, and breaks the one service per 
container rule, by design.
The dockerfile is also not optimized for compilation speed or size, having countless lines for running
commands separatedly, so it is easier to modify by anyone.

It installs all the components required to run Mautic in one single Docker container.
It deploys Apache2, PHP-FPM, MariaDB and Mautic, as well as many required packages
and some configuration files for those services.

The database is prepopulated with a user and a Mautic database as well as the Mautic DB schema,
so you don't have to go through Mautic's installation (wizard) process.

# How to use:
## Deploy from DockerHub
The easiest way to use this image is to deploy it directly from the Docker Hub, use this command:

docker run -d
## Clone this repo and build

How to use:
Run from docker hub (recommended)

docker run -d --name KISSmauticDKR -p 8080:80 martechws/kiss-mautic:latest

Use your browser to navigate to http://localhost:8080

To login into the container:

docker exec -ti KISSmauticDKR bash

Build locally:

git clone Martech-WorkShop/KISSMauticDKR docker build -f 521.Dockerfile . -t KISSmauticDKR:5.2.1 docker run -d --name KISSmauticDKR -p 8080:80 martechws/kiss-mautic:5.2.1 docker exec -ti KISSmauticDKR bash

## Intended uses: 
 - A simple way to test Mautic, pull & play.
 - A live overview of Mautic requirements.
 - A starting point for Mautic code exploration and tinkering.
 - A way to learn about Dockerization, Dockerfiles and Docker image creation.

It is NOT meant as a production ready image.

If you have any ideas how to make it clearer or simpler, please send me an email, submit a PR or an Issue.

We use ARGuments to parametrize the build-time parameters.
While Debian is the only OS supported by this Dockerfile,
you should be able to try other versions of Debian by adjusting the OS_VER ARG.

This particular Dockerfile is intended for documentation.
There is a properly optimized verion of this dockerfile without comments and with RUN commands grouped.

All the files for this dockerfile are on this GitHub repository:
https://github.com/Martech-WorkShop/toolBelt

## Contributors:
We need help extending the KISS---DKR goodness to other projects, bringing simplicity to instaling and managing open-martech software.

 - Automating image generation.
 - Automating the publishing process.
 - Writing tests.
 - Automating testing.
 - Writing new Dockerfiles for Open-Martech Software.
 - Writing Docker Compose files for Open-Martech Software.
 - Improving the existing files.
   

```


                                 --                                   
                           ((((((()))))))                              
                      ((((((((         ))))))                          
                   (((((                      ,                     
                ((((                        ***    )))                  
              ((((                        ****      )))           
             ((((          ,             ****        )))                 
            (((           ****         ****           )))              
           (((           *******     *****             )))             
           (((          ********** ******  **          )))             
           (((         ****   *********   ****         )))             
           (((        ****     ******      ****        )))             
           (((       ****         *         ****       )))             
            (((     ****                     ****     )))              
             ((((                                   ))))               
               (((                                 )))                 
                (((((                           )))))                  
                   (((((                     )))))                     
                       (((((((         )))))))                        
                            (((((()))))))                              
                                 --                                   
                      _     _                _                   
                     | |   | |              | |                  
           ________  | | __| |_  ____     __| |  ___ __   __     
          |  _   _ \ | |/ /| __|/ _  |   / _  | / _ \  \ / /           
          | | | | | ||   < | |_| (_| | _| (_| ||  __/ \ V /      
          |_| |_| |_||_|\_\ \__|\___ |(_)\____| \___|  \_/       
                         _       __/ |                           
                        | |     |___/                            
   ________   ____ _   _| |_ ___  ____ _______        ___  ____ ____ 
  |  _   _ \ / _  | | | | __/ _ \/ _  |  _   _ \     / _ \|  __/ _  |
  | | | | | | (_| | |_| | ||  __/ (_| | | | | | | _  |(_) | | | (_| |
  |_| |_| |_|\__,_|\__,_|\__\___|\__,_|_| |_| |_|(_) \___/|_|  \__, |
                                                                __/ |
                                                               |___/ 

```

ToDo:


1 - Reorganize the Git directory structure so the additional files, required for building the image, are present on the GitHub repoi too.

2 - Automate builds

3 - Automate tests

4 - Automate image build and push tothe Docker Hub. 
