FROM maven:3.5.4-jdk-8

# Download Hippo
RUN mvn org.apache.maven.plugins:maven-archetype-plugin:2.4:generate \
    -DarchetypeRepository=https://maven.onehippo.com/maven2 \
    -DarchetypeGroupId=org.onehippo.cms7 \
    -DarchetypeArtifactId=hippo-project-archetype \
    -DarchetypeVersion=12.4.0

WORKDIR /myhippoproject

# Install dependencies
RUN mvn install

# Expose ports
EXPOSE 8080

# Start Hippo
CMD mvn verify && mvn -Pcargo.run -Drepo.path=storage
