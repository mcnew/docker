FROM razzek/tomcat0:8.0.26

COPY log4j.properties $CATALINA_BASE/lib/
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys \
        05AB33110949707C93A279E3D3EFE6B686867BA6 \
        07E48665A34DCAFAE522E5E6266191C37C037D42 \
        47309207D818FFD8DCD3F83F1931D684307A10A5 \
        541FBE7D8F78B25E055DDEE13C370389288584E7 \
        61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
        79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
        9BA44C2621385CB966EBA586F72C284D731FABEE \
        A27677289986DB50844682F8ACB77FC2E86E29AC \
        A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
        DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
        F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
        F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
&& gpg --keyserver pgp.mit.edu --recv-key 42196CA8 \
&& curl -fSLs 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/extras/tomcat-juli.jar' -o $CATALINA_HOME/lib/tomcat-juli.jar \
&& curl -fSLs 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/extras/tomcat-juli.jar.asc' -o $CATALINA_HOME/lib/tomcat-juli.jar.asc \
&& curl -fSLs 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/extras/tomcat-juli-adapters.jar' -o $CATALINA_HOME/lib/tomcat-juli-adapters.jar \
&& curl -fSLs 'https://www.apache.org/dist/tomcat/tomcat-8/v8.0.26/bin/extras/tomcat-juli-adapters.jar.asc' -o $CATALINA_HOME/lib/tomcat-juli-adapters.jar.asc \
&& curl -fSLs 'https://www.apache.org/dist/logging/log4j/1.2.17/log4j-1.2.17.tar.gz' -o /tmp/log4j-1.2.17.tar.gz \
&& curl -fSLs 'https://www.apache.org/dist/logging/log4j/1.2.17/log4j-1.2.17.tar.gz.asc' -o /tmp/log4j-1.2.17.tar.gz.asc \
&& gpg --verify /tmp/log4j-1.2.17.tar.gz.asc \
&& gpg --verify $CATALINA_HOME/lib/tomcat-juli.jar.asc \
&& gpg --verify $CATALINA_HOME/lib/tomcat-juli-adapters.jar.asc \
&& tar xf /tmp/log4j-1.2.17.tar.gz -C $CATALINA_HOME/lib --no-same-owner --strip-components=1 'apache-log4j-1.2.17/log4j-1.2.17.jar' \
&& rm -rf $CATALINA_BASE/conf/logging.properties /tmp/log4j-1.2.17.tar.gz* $CATALINA_HOME/lib/*.asc /root/.gnupg \
&& chown service:service $CATALINA_BASE/lib/log4j.properties

USER service
