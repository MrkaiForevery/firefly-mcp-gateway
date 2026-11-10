package com.cmft.ff.mcp.gateway.auth;

import com.cmft.ff.mcp.gateway.entity.AuthMcpCommonInfo;
import com.cmft.ff.mcp.gateway.enums.McpSupportClientTypeEnums;
import io.modelcontextprotocol.common.McpTransportContext;
import jakarta.servlet.http.HttpServletRequest;


public abstract class AbstractClientAuthHandler {

    public abstract McpTransportContext extractAuthElementToMcpContext(HttpServletRequest request);

    public abstract AuthMcpCommonInfo buildMcpContextAuthObject(McpTransportContext mcpTransportContext);

    public abstract McpSupportClientTypeEnums getHandleClientType();
}
