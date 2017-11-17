/*****************************************************************************
 * Copyright (c) 2016, www.qingshixun.com
 *
 * All rights reserved
 *
*****************************************************************************/
package online.shixun.asl.module.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import online.shixun.asl.core.MyBatisRepository;
import online.shixun.asl.dto.UserDTO;

@MyBatisRepository
public interface UserDaoMyBatis {

	/**
	 * 获取用户列表
	 * @return
	 */
	List<UserDTO> getUsers();
	
	/**
	 * 根据用户id获取用户信息
	 * @param userId
	 * @return
	 */
	UserDTO getUser(@Param("userId") Long userId);
	
	/**
	 * 新增或更新用户
	 * @param user
	 */
	void saveOrUpdateUser(UserDTO user);
	
	/**
	 * 更新用户编码
	 * @param userId
	 * @param code
	 */
	void updateUserCode(@Param("userId") Long userId, @Param("code") String code);
	
	/**
	 * 根据用户id删除用户
	 * @param userId
	 */
	void removeUser(@Param("userId") Long userId);
	
	/**
	 * 根据用户id删除多个用户
	 * @param userId
	 */
	void removeUsers(@Param("userIds") String userIds);
	
}
