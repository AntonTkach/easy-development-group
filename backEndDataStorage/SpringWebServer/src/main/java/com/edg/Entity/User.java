package com.edg.Entity;

public class User {

    private int userID;
    private String userName;
    private String passwordHash;

    public User(int userID, String userName, String passwordHash) {
        this.userID = userID;
        this.userName = userName;
        this.passwordHash = passwordHash;
    }

    public User(){};

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }
}
