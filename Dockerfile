FROM sonarqube:9.3.0-community
LABEL maintainer.name="Andrey Etin" \
      maintainer.email="etinaa@yandex.ru"

#Add curl command
RUN apk --no-cache add curl

WORKDIR $SONARQUBE_HOME/lib/extensions

#Bundled plugins
ENV JAVA_PLUGIN_VERSION=7.9.0.28969 \
  KOTLIN_PLUGIN_VERSION=2.9.0.1147 \
  JAVASCRIPT_PLUGIN_VERSION=9.0.0.17505 \
  XML_PLUGIN_VERSION=2.5.0.3376 \
  JACOCO_PLUGIN_VERSION=1.1.1.1157

WORKDIR $SONARQUBE_HOME/extensions/plugins

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-kotlin-plugin/sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-jacoco-plugin-${JACOCO_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-jacoco-plugin/sonar-jacoco-plugin-${JACOCO_PLUGIN_VERSION}.jar

#Community plugins
ENV CHECKSTYLE_PLUGIN_VERSION=10.0 \
  FINDBUGS_PLUGIN_VERSION=4.0.6 \
  PMD_PLUGIN_VERSION=3.3.1 \
  GROOVY_PLUGIN_VERSION=1.8

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN_VERSION}/checkstyle-sonar-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar https://github.com/spotbugs/sonar-findbugs/releases/download/${FINDBUGS_PLUGIN_VERSION}/sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar https://github.com/jensgerdes/sonar-pmd/releases/download/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar https://github.com/Inform-Software/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar

WORKDIR $SONARQUBE_HOME