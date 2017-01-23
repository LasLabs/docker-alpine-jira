FROM openjdk:8-alpine
MAINTAINER LasLabs Inc <support@laslabs.com>

ARG JIRA_VERSION=7.3.0

ENV JIRA_HOME=/var/atlassian/application-data/jira
ENV JIRA_INSTALL=/opt/atlassian/jira

ENV JIRA_DOWNLOAD_URI=https://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-core-${JIRA_VERSION}.tar.gz

ENV RUN_USER=jira
ENV RUN_GROUP=jira

# Setup Jira User & Group
RUN addgroup -S "${RUN_GROUP}" \
    && adduser -S -s /bin/false -G "${RUN_GROUP}" "${RUN_USER}"

# Install build deps
RUN apk add --no-cache --virtual .build-deps \
    curl \
    tar

# Create home, install, and conf dirs
RUN mkdir -p "${JIRA_HOME}" \
             "${JIRA_INSTALL}/conf/Catalina"

# Download assets and extract to appropriate locations
RUN curl -Ls "${JIRA_DOWNLOAD_URI}" \
    | tar -xz --directory "${JIRA_INSTALL}" \
        --strip-components=1 --no-same-owner

# Setup permissions
RUN chmod -R 700 "${JIRA_HOME}" \
                 "${JIRA_INSTALL}/conf" \
                 "${JIRA_INSTALL}/temp" \
                 "${JIRA_INSTALL}/logs" \
                 "${JIRA_INSTALL}/work" \
    && chown -R ${RUN_USER}:${RUN_GROUP} "${JIRA_HOME}" \
                                         "${JIRA_INSTALL}/conf" \
                                         "${JIRA_INSTALL}/temp" \
                                         "${JIRA_INSTALL}/logs" \
                                         "${JIRA_INSTALL}/work"

# Update configs
RUN sed --in-place "s/java version/openjdk version/g" "${JIRA_INSTALL}/bin/check-java.sh" \
    && echo -e "\njira.home=${JIRA_HOME}" >> "${JIRA_INSTALL}/atlassian-jira/WEB-INF/classes/jira-application.properties" \
    && touch -d "@0" "${JIRA_INSTALL}/conf/server.xml"

# Remove build dependencies
RUN apk del .build-deps

# Switch from root
USER "${RUN_USER}":"${RUN_GROUP}"

# Expose ports
EXPOSE 8080

# Persist both the install and home dirs
VOLUME ["${JIRA_INSTALL}", "${JIRA_HOME}"]

# Set working directory to install directory
WORKDIR "${JIRA_INSTALL}"

# Run in foreground
CMD ["./bin/catalina.sh", "run"]

# Copy & set entrypoint for manual access
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
