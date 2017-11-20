SonarQube in Docker container
=============================
Starting [SonarQube](http://www.sonarqube.org/) with embedded H2 database in [Docker](https://www.docker.com/) container.


Usage
-----------------------------
Run in console:

```
docker-compose up --build
```

After starting container open URL:

```
http://localhost:9000
```

Links
-----------------------------
[SonarQube image](https://hub.docker.com/_/sonarqube/)

Used bundled plugins:

[Sonar Git](https://docs.sonarqube.org/display/PLUG/Git+Plugin);
[Sonar Java](https://docs.sonarqube.org/display/PLUG/SonarJava);
[Sonar JavaScript](https://docs.sonarqube.org/display/PLUG/SonarJS);
[Sonar Web](https://docs.sonarqube.org/display/PLUG/SonarWeb);
[Sonar XML](https://docs.sonarqube.org/display/PLUG/SonarXML)

Used community plugins:

[Sonar Checkstyle](https://github.com/checkstyle/sonar-checkstyle);
[Sonar FindBugs](https://github.com/SonarQubeCommunity/sonar-findbugs);
[Sonar Groovy](https://github.com/pmayweg/sonar-groovy);
[Sonar PMD](https://github.com/SonarQubeCommunity/sonar-pmd)
