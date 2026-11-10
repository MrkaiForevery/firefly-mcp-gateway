package com.cmft.ff.mcp.gateway.repository;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cmft.ff.mcp.gateway.entity.RoleBindElementPolicyDO;
import com.cmft.ff.mcp.gateway.mapper.RoleBindElementPolicyMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;

@Slf4j
@Component
@RequiredArgsConstructor
public class RoleBindElementPolicyRepository {

    private final RoleBindElementPolicyMapper roleBindElementPolicyMapper;

    public List<RoleBindElementPolicyDO> findPoliciesByRoles(Set<String> roleCodeSet) {
        LambdaQueryWrapper<RoleBindElementPolicyDO> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.in(RoleBindElementPolicyDO::getRoleCode,roleCodeSet)
                .apply("del_logic = B'0'");
        return roleBindElementPolicyMapper.selectList(queryWrapper);
    }
}
