package com.crm.model;
/**
 * 用户表实体类，用户对象
 * @author Bank
 */
public class User {
    private Long userId;

    private String userName;

    private String userPassword;

    private Long userRoleId;

    private Integer userFlag;
    
    public User() {
		super();
	}    
    
	public User(String userName, String userPassword) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
	}

	public User(Long userId, String userName, String userPassword, Long userRoleId, Integer userFlag) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRoleId = userRoleId;
		this.userFlag = userFlag;
	}

	public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword == null ? null : userPassword.trim();
    }

    public Long getUserRoleId() {
        return userRoleId;
    }

    public void setUserRoleId(Long userRoleId) {
        this.userRoleId = userRoleId;
    }

    public Integer getUserFlag() {
        return userFlag;
    }

    public void setUserFlag(Integer userFlag) {
        this.userFlag = userFlag;
    }

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userPassword=" + userPassword + ", userRoleId="
				+ userRoleId + ", userFlag=" + userFlag + "]";
	}
      
}