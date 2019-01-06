package com.honey.user.web;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.honey.common.Paging;
import com.honey.common.Result;
import com.honey.user.service.User;
import com.honey.user.service.UserService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Locale locale, Model model) {
		logger.debug("Execute: UserController -> user(Locale locale, Model model)");
		return "user";
	}
	
	/**
	 * Insert an user into the USER table.
	 * <p>Use {@link #insertUser(User user)} to insert an user into USER table.</p>
	 * @param user is an User object
	 * @return this is void function
	 * @throws JsonProcessingException 
	 * @exception an exception throwing if any
	 */
	
	@ResponseBody
	@RequestMapping(value = "/insertUser.json", method=RequestMethod.POST, /*consumes="application/json",*/ produces="application/json;charset=UTF-8")
	public String insertUser(Model model, @Validated User user, Result result) throws Exception {
		logger.debug("Execute: UserController -> insertUser(Model model, @Validated User user, Result result) -> user: " + user.toString());
		ObjectMapper mapper = new ObjectMapper();
		try {
			userService.insertUser(user);
			result.setSuccess(true);
			result.setObject("Tạo người dùng thành công!");
		} catch(Exception e) {
			result.setSuccess(false);
			result.setObject(e.getMessage());
		} finally {
			return mapper.writeValueAsString(result);
		}
	}
	
	/**
	 * Select a list of users matching with a condition.
	 * <p>Use {@link #selectUserList(User user)} to select a list of user fitting with a condition from USER table.</p>
	 * @param user is an User object which is the condition of matching
	 * @return a list of user, null if there are no record matched with the condition
	 * @exception an exception throwing if any
	 */
	@ResponseBody
	@RequestMapping(value = "/selectUserList.json", method = RequestMethod.POST, /*consumes="application/json",*/ produces = "application/json;charset=UTF-8")
	public String selectUserList(Model model, @Validated User user, Result result) throws Exception {
		logger.debug("Execute: UserController -> selectUserList(Model model, @Validated User user, Result result) -> user: " + user.toString());
		ObjectMapper mapper = new ObjectMapper();
		try {
			result.setList(userService.selectUserList(user));
			result.setSuccess(true);
			result.setObject("Lấy dữ liệu thành công!");
		} catch(Exception e) {
			result.setSuccess(false);
			result.setObject(e.getMessage());
		} finally {
			return mapper.writeValueAsString(result);
		}
	}
	
	/**
	 * Select a list of user which is paged
	 * <p>Use {@link #selectUserListPaging(User user)} to select a paged list of users from USER table.</p>
	 * @param user is an User object which is the condition
	 * @return paged list of users
	 * @exception an exception throwing if any
	 */
	@ResponseBody
	@RequestMapping(value = "selectUserListPaging.json", method = RequestMethod.POST, /*consumes="application/json",*/ produces = "application/json;charset=UTF-8")
	public String selectUserListPaging(Model model, @Validated User user, Result result) throws Exception {
		logger.debug("Execute: UserController -> selectUserListPaging(Model model, @Validated User user, Result result) -> user: " + user.toString());
		ObjectMapper mapper = new ObjectMapper();
		try {
			Paging paging = new Paging(user.getPageNo(), user.getPageSize(), userService.selectUserListPagingTotCount(user));
			user.setPoint(paging.getPoint());
			result.setPaging(paging);
			result.setList(userService.selectUserListPaging(user));
			result.setSuccess(true);
			result.setObject("Lấy dữ liệu thành công!");
		} catch(Exception e) {
			result.setSuccess(false);
			result.setObject(e.getMessage());
		} finally {
			return mapper.writeValueAsString(result);
		}
	}
	
	/**
	 * Update USER table based on a condition
	 * <p>Use {@link #supdateUser(User user)} to update USER table on the records matched with the condition.</p>
	 * @param user is an User object which is the condition
	 * @return this is void function
	 * @exception an exception throwing if any
	 */
	@ResponseBody
	@RequestMapping(value = "/updateUser.json", method=RequestMethod.POST, /*consumes="application/json",*/ produces="application/json;charset=UTF-8")
	public String updateUser(Model model, @Validated User user, Result result) throws Exception {
		logger.debug("Execute: UserController -> updateUser(Model model, @Validated User user, Result result) -> user: " + user.toString());
		ObjectMapper mapper = new ObjectMapper();
		try {
			userService.updateUser(user);
			result.setSuccess(true);
			result.setObject("Lấy dữ liệu thành công!");
		} catch(Exception e) {
			result.setSuccess(false);
			result.setObject(e.getMessage());
		} finally {
			return mapper.writeValueAsString(result);
		}
	}
}
