package com.cmft.ff.mcp.gateway.parser;

import com.cmft.ff.mcp.gateway.utils.JudgeUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Set;

@Component
@RequiredArgsConstructor
public class IdentityTokenParser {

//    private final RedissonClient redissonClient;

    public Boolean checkIdentity(String token){
        if (JudgeUtils.isBlank(token) ) {
            return false;
        }
        return true;
    }

    public Set<String> parseDifyUserTokenRoles(String token){
        //todo 这里先模拟，后续可能需要解析完后，从redis里面获取权限信息
        return Set.of("sys_admin_role","identity_admin_role","order_admin_role","order_jd_role","code_admin_role");
    }

    public String parseDifyUserId(String token){
        //todo 这里先模拟
        return "sys_00001";
    }
}
