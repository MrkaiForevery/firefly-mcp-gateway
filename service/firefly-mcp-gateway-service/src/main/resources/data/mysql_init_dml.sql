INSERT INTO firefly.auth_black_list_mapping (client_type, black_mapping_key_json, deny_target_element_codes,
                                             effect_flag, description, del_logic, created_by, created_time, update_by,
                                             update_time)
VALUES ('codex_agent_client_type', '{"operator_list": ["60329", "60327"]}', '111000000_1001', '1', 'codex黑名单', '0',
        'admin', '2026-10-30 09:08:26.497693', NULL, NULL),
       ('dify_agent_client_type', '{"user_id_list": ["10086", "10087"]}', '112000000_1001', '1', 'dify黑名单', '0',
        'admin', '2026-10-30 09:08:26.497693', NULL, NULL);

INSERT INTO firefly.auth_domain_def (domain_level, father_domain_code, domain_code, domain_name, description, del_logic,
                                     created_by, created_time, update_by, update_time)
VALUES (2, '100000000', '110000000', '身份域-用户类型域', '身份域-用户类型域二级', '0', 'admin',
        '2026-10-29 16:32:34.387629', NULL, NULL),
       (3, '110000000', '111000000', '身份域-用户类型-移动用户域', '身份域-用户类型-移动用户域三级', '0', 'admin',
        '2026-10-29 16:32:34.388791', NULL, NULL),
       (3, '110000000', '112000000', '身份域-用户类型-pc用户域', '身份域-用户类型-pc用户域三级', '0', 'admin',
        '2026-10-29 16:32:34.389518', NULL, NULL),
       (2, '100000000', '120000000', '身份域-机器类型域', '身份域-机器类型域二级', '0', 'admin',
        '2026-10-29 16:32:34.390092', NULL, NULL),
       (1, '-1', '100000000', '身份域', '身份主域一级', '0', 'admin', '2026-10-29 16:32:07.900075', NULL, NULL),
       (1, '-1', '200000000', '代码域', '代码主域一级', '0', 'admin', '2026-10-29 16:35:23.237065', NULL, NULL),
       (2, '200000000', '210000000', '代码域-java代码域', '代码域-java代码域二级', '0', 'admin',
        '2026-10-29 16:37:05.127862', NULL, NULL),
       (3, '210000000', '211000000', '代码域-java代码域-监控服务代码域', '代码域-java代码域-监控服务代码域三级', '0',
        'admin', '2026-10-29 16:39:16.669126', NULL, NULL),
       (4, '211000000', '211100000', '代码域-java代码域-监控服务代码域-log日志服务域',
        '代码域-java代码域-监控服务代码域-log日志服务域四级', '0', 'admin', '2026-10-29 16:40:46.989801', NULL, NULL);

INSERT INTO firefly.auth_element_def (element_type, sensitivity_type, element_code, element_name, relation_domain_code,
                                      description, del_logic, created_by, created_time, update_by, update_time)
VALUES ('mcp_tools_type', 'read', 'query_mobile_user_base_info', 'queryMobileUserBaseInfo', '111000000',
        '查询移动用户的基本信息', '0', 'admin', '2026-10-29 16:48:19.546891', NULL, NULL),
       ('mcp_prompt_type', 'read', 'fill_code_check_prompt', 'fillCodeCheckPrompt', '211100000',
        '提供检查logserver服务代码的检查提示词', '0', 'admin', '2026-10-29 17:01:25.569968', NULL, NULL),
       ('mcp_tools_type', 'read', 'query_code_check_result_base_info', 'queryCodeCheckResultBaseInfo', '112000000',
        '查询代码审查结果', '0', 'admin', '2026-10-29 16:50:11.774536', NULL, NULL),
       ('mcp_resources_type', 'read', 'db://identity/machine/schema', 'readMachineTableSchemaInfo', '120000000',
        '提供机器列表信息', '0', 'admin', '2026-10-29 16:56:35.202942', NULL, NULL);

INSERT INTO firefly.auth_role_def (role_code, role_name, description, del_logic, created_by, created_time, update_by,
                                   update_time)
VALUES ('1000000', 'all_admin_role', '所有系统级管理员角色', '0', 'admin', '2026-10-29 17:18:29.95792', NULL, NULL),
       ('1100000', 'identity_admin_role', '身份认证系统管理员角色', '0', 'admin', '2026-10-29 17:19:51.326772', NULL,
        NULL),
       ('1110000', 'identity_mobile_role', '身份认证-移动业务角色', '0', 'admin', '2026-10-29 17:21:44.726999', NULL,
        NULL),
       ('1120000', 'identity_pc_role', '身份认证-pc业务角色', '0', 'admin', '2026-10-29 17:21:44.726999', NULL, NULL),
       ('1200000', 'code_admin_role', '代码系统管理员角色', '0', 'admin', '2026-10-29 17:23:37.959186', NULL, NULL),
       ('1210000', 'code_java_role', '代码-java类业务角色', '0', 'admin', '2026-10-29 17:25:01.219412', NULL, NULL),
       ('1211000', 'code_java_monitor_role', '代码-java类-监控monitor业务角色', '0', 'admin',
        '2026-10-29 17:28:27.243794', NULL, NULL);

INSERT INTO firefly.client_key_bind_role_policy (client_type, client_mapping_key_json, bind_role_code, description,
                                                 del_logic, created_by, created_time, update_by, update_time)
VALUES ('dify_agent_client_type', '{"agent_id": "code-agent-id-950925", "user_role": "code_admin_role"}', '1200000',
        'dify平台agent访问code系统', '0', 'admin', '2026-10-29 17:55:43.717901', NULL, NULL),
       ('dify_agent_client_type', '{"agent_id": "identity-agent-id-950000", "user_role": "identity_admin_role"}',
        '1100000', 'dify平台agent访问identity系统', '0', 'admin', '2026-10-29 17:51:16.923583', NULL, NULL),
       ('codex_agent_client_type',
        '{"agent_id": "identity-agent-id-84832", "global_auth": "false", "operator_auth": "identity_admin_role"}',
        '1100000', 'codex平台agent访问identity系统', '0', 'admin', '2026-10-30 08:55:34.985535', NULL, NULL),
       ('codex_agent_client_type',
        '{"agent_id": "code-agent-id-950925", "global_auth": "false", "operator_auth": "code_admin_role"}', '1200000',
        'codex平台agent访问code系统', '0', 'admin', '2026-10-30 08:55:34.985535', NULL, NULL);

INSERT INTO firefly.role_bind_element_policy (role_code, element_code, description, del_logic, created_by, created_time,
                                              update_by, update_time)
VALUES ('1000000', 'query_mobile_user_base_info', '所有系统级管理员', '0', 'admin', '2026-10-29 17:31:15.25952', NULL,
        NULL),
       ('1100000', 'query_code_check_result_base_info', '身份认证系统管理员', '0', 'admin', '2026-10-29 17:31:15.25952',
        NULL, NULL),
       ('1200000', 'db://identity/machine/schema', '机器信息表结构资源访问角色', '0', 'admin',
        '2026-11-05 09:05:15.227888', NULL, NULL),
       ('1200000', 'fill_code_check_prompt', '代码检查提示词获取角色', '0', 'admin', '2026-11-05 10:43:27.61972', NULL,
        NULL),
       ('1200000', 'query_mobile_user_base_info', '所有系统级管理员', '0', 'admin', '2026-11-05 14:19:56.422832', NULL,
        NULL),
       ('1200000', 'query_code_check_result_base_info', '身份认证系统管理员', '0', 'admin',
        '2026-11-05 14:19:56.425022', NULL, NULL);
