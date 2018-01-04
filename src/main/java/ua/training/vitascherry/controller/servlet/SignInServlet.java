package ua.training.vitascherry.controller.servlet;

import ua.training.vitascherry.model.entity.User;
import ua.training.vitascherry.model.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static ua.training.vitascherry.controller.util.Message.INVALID_CREDENTIALS;

public class SignInServlet extends HttpServlet {

    private final UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        getServletContext().getNamedDispatcher("MainServlet").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("\nProcessing Sign in doPOST()...");
        User user = userService.getUserByEmail(req.getParameter("email"));
        System.out.println("User: " + user);
        if (user != null && userService.isValidCredentials(user, req.getParameter("password"))) {
            req.getSession().setAttribute("user", user);
        } else {
            req.setAttribute("invalidCredentials", INVALID_CREDENTIALS);
        }
        String responsePage = userService.getSignInNextPage();
        System.out.println("Response page: " + responsePage);
        req.getRequestDispatcher(responsePage).forward(req, resp);
    }
}