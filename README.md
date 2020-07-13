# Basic Dockerized Drupal 9 Project

This project allows for the ease of module, profile, and theme development by allowing Docker to take care of running and configuring Apache and MySql. Any themes, profiles, or modules should be placed inside this project's themes, modules, and profiles directory. These directories will be mounted as volumes.

## Installation

### 0. Install Docker
This project uses Docker to manage the installation and configuration of Drupal's dependencies. Make sure that Docker is installed on your host machine. Installation instructions can be found here: [Mac](https://docs.docker.com/v17.12/docker-for-mac/install/)  |  [Windows](https://docs.docker.com/docker-for-windows/install/)  |  [Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

### 1. Build the project.

In order to use this project it must be built in the terminal. 

Use:

```
$ docker-compose build
```

The build step will take awhile as it configures the container to meet Drupal's requirements. Ideally this step is only necessary once -- unless of course the container is removed. Because this step creates a brand new Drupal installation, anytime this command is run you will run into Drupal's initial configuration setup because Drupal will need the database credentials again.

### 2. Launch the projecct.

Use:

```
$ docker-compose up
```

In order to launch the project. 

Anytime you want to shutdown the container use `ctrl-c` to stop the process. Use `docker-compose up` again to launch the container the next time you want to use it.

You will be able to access the Drupal installation in your browser at `localhost:8083/`

### 3. Set database credentials.

Visit `localhost:8083/` to set up Drupal.

The database credentials exists in `docker-compose.yml` and have these default values: 

```yml
    environment:
      MYSQL_DATABASE: app
      MYSQL_USER: web
      MYSQL_PASSWORD: pass
```

**Special Note**

It's recommended to change the default database credentials to those that aren't published in a public repository on the internet. After doing that you'll need to repeat steps 1 and 2 above.

**IMPORTANT**

**Before submitting the database credentials proceed to step 4**

### 4. Set the Database Address
The default value `localhost` won't work and is hidden in the `Advanced` section when filling in the database credentials.
Because the database exists in a separate container this must be changed from `localhost` to `mysql`. This references the container's address in the docker network.

### 5. Rejoice
Now you should be able to finish Drupal's setup sequence and enter in your site information. 
After this, you should have a fully functional Drupal 8 installation without the need to install and configure php, apache, and mysql on your host machine. 

**Note**
This project is for creating a dev environment to create and test themes, modules, and profiles. **It does not attempt to solve any update regimes that must be in place on the production server.** Be very careful before implementing this project in a mission critical production environment to avoid issues when updates are released.


## Version 1.0b
Project Directories:
Certain directories have been made available as volumes in order to view changes to developed projects. These folders will be mounted to the appropriate directories in the Drupal installation.

`modules`: Include modules to install into Drupal

`profiles`: Scripts to setup profiles

`themes`: Themes to change the way Drupal looks

`sites`: Site settings

Included version of Drupal: 9.0.1

## License
MIT