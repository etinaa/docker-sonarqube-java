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

[Sonar Java](https://docs.sonarqube.org/latest/analysis/languages/java/);
[Sonar Kotlin](https://docs.sonarqube.org/latest/analysis/languages/kotlin/);
[Sonar JavaScript](https://docs.sonarqube.org/latest/analysis/languages/javascript/);
[Sonar XML](https://docs.sonarqube.org/latest/analysis/languages/xml/);
Sonar Jacoco

Used community plugins:

[Sonar Checkstyle](https://github.com/checkstyle/sonar-checkstyle);
[Sonar FindBugs](https://github.com/SonarQubeCommunity/sonar-findbugs);
[Sonar PMD](https://github.com/SonarQubeCommunity/sonar-pmd);
[Sonar Groovy](https://github.com/Inform-Software/sonar-groovy)
