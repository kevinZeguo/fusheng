package com.beijing.geek.cms.sys.dao.user;

import com.beijing.geek.cms.sys.domain.user.SysRoleDepart;

public interface SysRoleDepartDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    int deleteById(Integer roleDeptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    int insert(SysRoleDepart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    int insertSelective(SysRoleDepart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    SysRoleDepart selectById(Integer roleDeptId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    int updateByIdSelective(SysRoleDepart record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_role_depart
     *
     * @mbggenerated
     */
    int updateById(SysRoleDepart record);
}