
-- 权限角色定义表

DROP TABLE IF EXISTS auth_role_def;

CREATE TABLE auth_role_def (
                               id INT AUTO_INCREMENT COMMENT '主键id',
                               role_code VARCHAR(64) NOT NULL COMMENT '角色编号',
                               role_name VARCHAR(128) NOT NULL COMMENT '角色名称',
                               description VARCHAR(512) COMMENT '角色描述',
                               del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                               created_by VARCHAR(64) COMMENT '创建者',
                               created_time DATETIME COMMENT '创建时间',
                               update_by VARCHAR(64) COMMENT '修改者',
                               update_time DATETIME COMMENT '修改时间',
                               PRIMARY KEY (id),
                               UNIQUE KEY UNQ_ROLE_CODE (role_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限角色定义表';

-- 权限域定义表(树型结构)

DROP TABLE IF EXISTS auth_domain_def;
CREATE TABLE auth_domain_def (
                                 id INT AUTO_INCREMENT COMMENT '主键id',
                                 domain_level INT NOT NULL COMMENT '域级别', -- PG的INT2在MySQL可用INT或TINYINT
                                 father_domain_code VARCHAR(64) NOT NULL COMMENT '父域编码',
                                 domain_code VARCHAR(64) COMMENT '域编码',
                                 domain_name VARCHAR(128) COMMENT '域名称',
                                 description VARCHAR(512) COMMENT '域描述',
                                 del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                                 created_by VARCHAR(64) COMMENT '创建者',
                                 created_time DATETIME COMMENT '创建时间',
                                 update_by VARCHAR(64) COMMENT '修改者',
                                 update_time DATETIME COMMENT '修改时间',
                                 PRIMARY KEY (id),
                                 UNIQUE KEY UNQ_DOMAIN_CODE (domain_code DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限域定义表(树型结构)';

-- 权限控制元素定义表
DROP TABLE IF EXISTS auth_element_def;
CREATE TABLE auth_element_def (
                                  id INT AUTO_INCREMENT COMMENT '主键id',
                                  element_type VARCHAR(32) NOT NULL COMMENT '元素类型(tool/resource/prompt)',
                                  sensitivity_type VARCHAR(32) NOT NULL COMMENT '元素敏感度类型(read/write/...)',
                                  element_code VARCHAR(128) NOT NULL COMMENT '元素编码(tool 类别使用toolName为唯一code，resource类别以resourceUri为唯一code，prompt类别以promptName为唯一code)',
                                  element_name VARCHAR(128) NOT NULL COMMENT '元素名称',
                                  relation_domain_code VARCHAR(64) NOT NULL COMMENT '元素所在域编码',
                                  description VARCHAR(512) COMMENT '元素描述',
                                  del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                                  created_by VARCHAR(64) COMMENT '创建者',
                                  created_time DATETIME COMMENT '创建时间',
                                  update_by VARCHAR(64) COMMENT '修改者',
                                  update_time DATETIME COMMENT '修改时间',
                                  PRIMARY KEY (id),
                                  UNIQUE KEY UNQ_ELEMENT_CODE (element_code DESC)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限控制元素定义表';

-- 权限角色绑定权限元素策略表
DROP TABLE IF EXISTS role_bind_element_policy;

CREATE TABLE role_bind_element_policy (
                                          id INT AUTO_INCREMENT COMMENT '主键id',
                                          role_code VARCHAR(64) NOT NULL COMMENT '角色编号',
                                          element_code VARCHAR(128) NOT NULL COMMENT '元素编码',
                                          description VARCHAR(512) COMMENT '策略描述',
                                          del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                                          created_by VARCHAR(64) COMMENT '创建者',
                                          created_time DATETIME COMMENT '创建时间',
                                          update_by VARCHAR(64) COMMENT '修改者',
                                          update_time DATETIME COMMENT '修改时间',
                                          PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限角色绑定权限元素策略表';

-- 客户端key 绑定 角色 策略表
DROP TABLE IF EXISTS client_key_bind_role_policy;
CREATE TABLE client_key_bind_role_policy (
                                             id INT AUTO_INCREMENT COMMENT '主键id',
                                             client_type VARCHAR(32) NOT NULL COMMENT '客户端类型(如dify/codex/....)',
                                             client_mapping_key_json JSON NOT NULL COMMENT '客户端映射key(json类)',
                                             bind_role_code VARCHAR(64) NOT NULL COMMENT '绑定的角色编码',
                                             description VARCHAR(512) COMMENT '策略描述',
                                             del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                                             created_by VARCHAR(64) COMMENT '创建者',
                                             created_time DATETIME COMMENT '创建时间',
                                             update_by VARCHAR(64) COMMENT '修改者',
                                             update_time DATETIME COMMENT '修改时间',
                                             PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='客户端key 绑定 角色 策略表';

-- 权限黑名单映射表
DROP TABLE IF EXISTS auth_black_list_mapping;
CREATE TABLE auth_black_list_mapping (
                                         id INT AUTO_INCREMENT COMMENT '主键id',
                                         client_type VARCHAR(32) NOT NULL COMMENT '客户端类型(如dify/codex/....)',
                                         black_mapping_key_json JSON NOT NULL COMMENT '客户端映射key(json类)',
                                         deny_target_element_codes VARCHAR(512) NOT NULL COMMENT '拒绝使用的权限元素',
                                         effect_flag TINYINT(1) NOT NULL DEFAULT 1 COMMENT '是否生效',
                                         description VARCHAR(512) COMMENT '描述',
                                         del_logic TINYINT(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除标识',
                                         created_by VARCHAR(64) COMMENT '创建者',
                                         created_time DATETIME COMMENT '创建时间',
                                         update_by VARCHAR(64) COMMENT '修改者',
                                         update_time DATETIME COMMENT '修改时间',
                                         PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='权限黑名单映射表';

-- 机器列表信息表
DROP TABLE IF EXISTS machine_list_info;
CREATE TABLE machine_list_info (
                                   machine_id VARCHAR(64) DEFAULT NULL COMMENT '机器唯一标识id',
                                   machine_name VARCHAR(128) DEFAULT NULL COMMENT '机器名称',
                                   owner_id VARCHAR(64) DEFAULT NULL COMMENT '所有者id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--- 机器详情信息表
DROP TABLE IF EXISTS machine_detail_info;
CREATE TABLE machine_detail_info (
                                     machine_id VARCHAR(64) DEFAULT NULL COMMENT '机器唯一标识id',
                                     machine_name VARCHAR(128) DEFAULT NULL COMMENT '机器名称',
                                     owner_id VARCHAR(64) DEFAULT NULL COMMENT '所有者id',
                                     detail_description TEXT DEFAULT NULL COMMENT '详细描述',
                                     `location` VARCHAR(255) DEFAULT NULL COMMENT '位置' -- location 不是保留字，但加反引号更安全
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;