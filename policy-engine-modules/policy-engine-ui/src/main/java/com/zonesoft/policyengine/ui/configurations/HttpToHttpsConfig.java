package com.zonesoft.policyengine.ui.configurations;

import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HttpToHttpsConfig {

    @Value(value = "${server.ssl.key-store:}")
    private String sslKeyStore;

    @Value(value = "${server.http.port:80}")
    private int httpPort;

    @Value("${server.port:443}")
    int httpsPort;

    @Bean
    public ServletWebServerFactory servletContainer() {
        boolean enableRedirectToHttps = sslKeyStore != null && !sslKeyStore.isEmpty();

        TomcatServletWebServerFactory tomcat = null;

        if (!enableRedirectToHttps) {
            tomcat = new TomcatServletWebServerFactory();
            return tomcat;
        }

        tomcat = new TomcatServletWebServerFactory() {

            @Override
            protected void postProcessContext(Context context) {
                SecurityConstraint securityConstraint = new SecurityConstraint();
                securityConstraint.setUserConstraint("CONFIDENTIAL");
                SecurityCollection collection = new SecurityCollection();
                collection.addPattern("/*");
                securityConstraint.addCollection(collection);
                context.addConstraint(securityConstraint);
            }
        };
        tomcat.addAdditionalTomcatConnectors(redirectConnector());
        return tomcat;
    }

    private Connector redirectConnector() {
        Connector connector = new Connector(TomcatServletWebServerFactory.DEFAULT_PROTOCOL);
        connector.setScheme("http");
        connector.setPort(httpPort);
        connector.setSecure(false);
        connector.setRedirectPort(httpsPort);
        return connector;
    }
}
