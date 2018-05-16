package com.edg.Analytics;

import com.edg.Dao.ServerDaoImpl;

public class TasksAnalysis {
    public static void updateTotalTasksNumber(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE TasksAnalysis SET totalTasks = (SELECT count(*) FROM Tasks WHERE userID=" + Integer.toString(userID) + ") WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.updateTotalTasksNumber(query);
    }

    public static void updateTasksDoneNumber(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE TasksAnalysis SET totalTasksDone = (SELECT count(*) FROM Tasks WHERE isCompleted=1 AND userID=" + Integer.toString(userID) + ") WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.updateTasksDoneNumber(query);
    }

    public static String getTasksAnalysisJSON(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "SELECT totalTasks, totalTasksDone FROM TasksAnalysis WHERE userID=" + Integer.toString(userID);
        return serverDaoImpl.getTasksAnalysisJSON(query);
    }
}
