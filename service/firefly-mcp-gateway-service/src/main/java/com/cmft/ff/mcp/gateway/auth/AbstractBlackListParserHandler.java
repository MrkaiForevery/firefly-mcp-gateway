package com.cmft.ff.mcp.gateway.auth;


import com.cmft.ff.mcp.gateway.entity.AuthBlackListMappingDO;
import com.cmft.ff.mcp.gateway.enums.McpSupportClientTypeEnums;

import java.util.List;
import java.util.Map;
import java.util.Set;


public abstract class AbstractBlackListParserHandler {

    public abstract Map<String,List<String>> parserBlackList(List<AuthBlackListMappingDO> baseBlackList);

    public abstract McpSupportClientTypeEnums getHandleClientType();

    public abstract Set<String> doFilter(List<String> userIdJsonList, Map<String, List<String>> allBaseBlackMap, Set<String> baseElementCodeSet);
}
