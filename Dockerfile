FROM jboss/wildfly
RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent; mkdir /opt/jboss/logs/
#; ln -s /wflow /opt/jboss/wflow
ADD jw.war /opt/jboss/wildfly/standalone/deployments/
ADD wflow /opt/jboss/wflow
#ADD standalone-custom.xml /opt/wildfly/standalone/configuration/
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Doracle.jdbc.useFetchSizeWithLongColumn=true"]