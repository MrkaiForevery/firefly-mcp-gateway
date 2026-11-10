package com.cmft.ff.mcp.gateway.entity;

import com.cmft.ff.mcp.gateway.enums.McpSupportClientTypeEnums;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthMcpCommonInfo {

    private McpSupportClientTypeEnums clientTypeEnum;
    private List<String> blackMappingKeyJsonList;
    private List<String> clientMappingKeyJsonList;
}

