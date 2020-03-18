FROM sonarqube:8.2-community
LABEL maintainer.name="Andrey Etin" \
      maintainer.email="etinaa@yandex.ru"

WORKDIR $SONARQUBE_HOME/extensions/plugins

#Bundled plugins
ENV JAVA_PLUGIN_VERSION=6.2.0.21135 \
  KOTLIN_PLUGIN_VERSION=1.5.0.315 \
  JAVASCRIPT_PLUGIN_VERSION=5.2.1.7778 \
  XML_PLUGIN_VERSION=2.0.1.2020 \
  HTML_PLUGIN_VERSION=3.2.0.2082

#Community plugins
ENV CHECKSTYLE_PLUGIN_VERSION=4.30 \
  FINDBUGS_PLUGIN_VERSION=4.0.0 \
  PMD_PLUGIN_VERSION=3.2.1 \
  GROOVY_PLUGIN_VERSION=1.6

RUN set -x \
  && rm -rf sonar-*.jar \
  && curl -fSL -o sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-java-plugin/sonar-java-plugin-${JAVA_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-kotlin-plugin/sonar-kotlin-plugin-${KOTLIN_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-${JAVASCRIPT_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-${XML_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-html-plugin-${HTML_PLUGIN_VERSION}.jar https://binaries.sonarsource.com/Distribution/sonar-html-plugin/sonar-html-plugin-${HTML_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-checkstyle-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar https://github.com/checkstyle/sonar-checkstyle/releases/download/${CHECKSTYLE_PLUGIN_VERSION}/checkstyle-sonar-plugin-${CHECKSTYLE_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar https://github.com/spotbugs/sonar-findbugs/releases/download/${FINDBUGS_PLUGIN_VERSION}/sonar-findbugs-plugin-${FINDBUGS_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar https://github.com/jensgerdes/sonar-pmd/releases/download/${PMD_PLUGIN_VERSION}/sonar-pmd-plugin-${PMD_PLUGIN_VERSION}.jar \
  && curl -fSL -o sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar https://github.com/Inform-Software/sonar-groovy/releases/download/${GROOVY_PLUGIN_VERSION}/sonar-groovy-plugin-${GROOVY_PLUGIN_VERSION}.jar

WORKDIR $SONARQUBE_HOME