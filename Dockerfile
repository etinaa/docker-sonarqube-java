FROM sonarqube:7.1
LABEL maintainer.name="Andrey Etin" \
      maintainer.email="etinaa@yandex.ru"

#Bundled plugins
ENV GIT_PLUGIN_VERSION=1.4.0.1037 \
  JAVA_PLUGIN_VERSION=5.3.0.13828 \
  JAVASCRIPT_PLUGIN_VERSION=4.1.0.6085 \
  WEB_PLUGIN_VERSION=2.6.0.1053 \
  XML_PLUGIN_VERSION=1.5.0.1373

WORKDIR $SONARQUBE_HOME/lib/bundled-plugins

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-scm-git-plugin/sonar-scm-git-plugin-${GIT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-${WEB_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar https://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar

#Community plugins
ENV CHECKSTYLE_PLUGIN_VERSION=4.10 \
  FINDBUGS_PLUGIN_VERSION=3.7.0 \
  GROOVY_PLUGIN_VERSION=1.5 \
  PMD_PLUGIN_VERSION=2.6

WORKDIR $SONARQUBE_HOME/extensions/plugins

RUN set -x \
  && curl -fSL -o sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN_VERSION}/checkstyle-sonar-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar https://github.com/SonarQubeCommunity/sonar-findbugs/releases/download/${FINDBUGS_PLUGIN_VERSION}/sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar https://github.com/pmayweg/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar https://github.com/SonarQubeCommunity/sonar-pmd/releases/download/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar

WORKDIR $SONARQUBE_HOME
