package ua.training.vitascherry.controller.servlet;

import ua.training.vitascherry.controller.command.Command;
import ua.training.vitascherry.controller.command.GetCommandMap;
import ua.training.vitascherry.controller.command.PostCommandMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static ua.training.vitascherry.controller.util.RequestMapper.extractCommand;

public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Command command = extractCommand(req, GetCommandMap.getInstance());
        req.getRequestDispatcher(command.execute(req).getPage()).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        Command command = extractCommand(req, PostCommandMap.getInstance());
        req.getRequestDispatcher(command.execute(req).getPage()).forward(req, resp);
    }
}
