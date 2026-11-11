package com.cmft.ff.mcp.gateway;

import com.cmpay.lemon.common.LemonFramework;
import com.cmpay.lemon.framework.LemonBootApplication;

@LemonBootApplication
public class FireflyMcpGatewayApplication {
    public static void main(String[] args) {
        LemonFramework.run(FireflyMcpGatewayApplication.class, args);
    }
}
