package com.cmft.ff.mcp.gateway.repository;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cmft.ff.mcp.gateway.entity.AuthBlackListMappingDO;
import com.cmft.ff.mcp.gateway.mapper.AuthBlackListMappingMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
public class AuthBlackListMappingRepository {

    private final AuthBlackListMappingMapper authBlackListMappingMapper;

    public List<AuthBlackListMappingDO> findAllBlackListByClientType(String clientTypeKey) {
        LambdaQueryWrapper<AuthBlackListMappingDO> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(AuthBlackListMappingDO::getClientType,clientTypeKey)
                .apply("del_logic = B'0'")
                .apply("effect_flag = B'0'");
        return authBlackListMappingMapper.selectList(queryWrapper);
    }
}
