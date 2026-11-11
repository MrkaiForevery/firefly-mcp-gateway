package com.cmft.ff.mcp.gateway;

import com.cmpay.lemon.common.LemonFramework;
import com.cmpay.lemon.framework.LemonBootApplication;
import com.cmpay.lemon.framework.autoconfigure.eureka.EurekaAutoConfiguration;
import com.cmpay.lemonframework.concurrent.EnableConcurrent;
import org.springframework.boot.autoconfigure.amqp.RabbitAutoConfiguration;

@EnableConcurrent
@LemonBootApplication(
        exclude = {RabbitAutoConfiguration.class,EurekaAutoConfiguration.class}
)
public class FireflyMcpGatewayApplication {
    public static void main(String[] args) {
        LemonFramework.run(FireflyMcpGatewayApplication.class, args);
    }
}
