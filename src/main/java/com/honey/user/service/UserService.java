package com.honey.user.service;

import java.util.List;

public interface UserService {
	/**
	 * Insert an user into the USER table.
	 * <p>Use {@link #insertUser(User user)} to insert an user into USER table.</p>
	 * @param user is an User object
	 * @return this is void function
	 * @exception an exception throwing if any
	 */
	public void insertUser(User user) throws Exception;
	
	/**
	 * Select a list of users matching with a condition.
	 * <p>Use {@link #selectUserList(User user)} to select a list of user fitting with a condition from USER table.</p>
	 * @param user is an User object which is the condition of matching
	 * @return a list of user, null if there are no record matched with the condition
	 * @exception an exception throwing if any
	 */
	public List<User> selectUserList(User user) throws Exception;
	
	/**
	 * Select total number of record in USER table and basing on a specific condition. This function will support for paging data
	 * <p>Use {@link #selectUserListPagingTotCount(User user)} to select total number of users in USER table.</p>
	 * @param user is an User object which is the condition
	 * @return a number of users
	 * @exception an exception throwing if any
	 */
	public int selectUserListPagingTotCount(User user) throws Exception;
	
	/**
	 * Select a list of user which is paged
	 * <p>Use {@link #selectUserListPaging(User user)} to select a paged list of users from USER table.</p>
	 * @param user is an User object which is the condition
	 * @return paged list of users
	 * @exception an exception throwing if any
	 */
	public List<User> selectUserListPaging(User user) throws Exception;
	
	/**
	 * Update USER table based on a condition
	 * <p>Use {@link #supdateUser(User user)} to update USER table on the records matched with the condition.</p>
	 * @param user is an User object which is the condition
	 * @return this is void function
	 * @exception an exception throwing if any
	 */
	public void updateUser(User user) throws Exception;
}
