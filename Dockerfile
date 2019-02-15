FROM sonarqube:7.5-community
LABEL maintainer.name="Andrey Etin" \
      maintainer.email="etinaa@yandex.ru"

WORKDIR $SONARQUBE_HOME/extensions/plugins

#Bundled plugins
ENV JAVA_PLUGIN_VERSION=5.10.2.17019 \
  KOTLIN_PLUGIN_VERSION=1.4.0.155 \
  JAVASCRIPT_PLUGIN_VERSION=5.0.0.6962 \
  XML_PLUGIN_VERSION=2.0.1.2020 \
  HTML_PLUGIN_VERSION=3.1.0.1615

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-kotlin-plugin/sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar https://repox.sonarsource.com/sonarsource/org/sonarsource/xml/sonar-xml-plugin/${XML_PLUGIN_VERSION}/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-html-plugin-${HTML_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-html-plugin/sonar-html-plugin-${HTML_PLUGIN_VERSION}.jar

#Community plugins
ENV CHECKSTYLE_PLUGIN_VERSION=4.17 \
  FINDBUGS_PLUGIN_VERSION=3.9.2 \
  PMD_PLUGIN_VERSION=3.1.3

RUN set -x \ 
  && curl -fSL -o sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN_VERSION}/checkstyle-sonar-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar \
#  && curl -fSL -o sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar https://github.com/spotbugs/sonar-findbugs/releases/download/${FINDBUGS_PLUGIN_VERSION}/sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar
  && curl -fSL -o sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar https://github.com/jensgerdes/sonar-pmd/releases/download/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar
# https://github.com/pmayweg/sonar-groovy/issues/72  
#  && curl -fSL -o sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar https://github.com/pmayweg/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar

WORKDIR $SONARQUBE_HOME