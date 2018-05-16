package com.edg.Analytics;

import com.edg.Dao.ServerDaoImpl;

public class PomodorosAnalysis {
    public static void incrementTotalPomodorosNumber(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalPomodoros = totalPomodoros + 1 WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalPomodorosNumber(query);
    }

    public static void incrementTotalTimeSpent(int userID, int seconds, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalTimeSpent = totalTimeSpent + " + Integer.toString(seconds) + " WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalTimeSpent(query);
    }

    public static void incrementTotalTimeWork(int userID, int seconds, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalTimeWorked = totalTimeWorked + " + Integer.toString(seconds) + " WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalTimeWork(query);
    }

    public static void incrementTotalTimeRest(int userID, int seconds, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalTimeRest = totalTimeRest + " + Integer.toString(seconds) + " WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalTimeRest(query);
    }

    public static void incrementTotalWorkSkips(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalWorkSkips = totalWorkSkips + 1 WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalWorkSkips(query);
    }

    public static void incrementTotalRestSkips(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "UPDATE PomodorosAnalysis SET totalRestSkips = totalRestSkips + 1 WHERE userID=" + Integer.toString(userID);
        serverDaoImpl.incrementTotalRestSkips(query);
    }

    public static String getPomodorosAnalysisJSON(int userID, ServerDaoImpl serverDaoImpl)
    {
        String query = "SELECT totalPomodoros, totalTimeSpent, totalTimeWorked, totalTimeRest, totalWorkSkips, totalRestSkips FROM PomodorosAnalysis WHERE userID=" + Integer.toString(userID);
        return serverDaoImpl.getPomodorosAnalysisJSON(query);
    }
}
