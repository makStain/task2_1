package sprint.task.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import task.manager.DBManager;
import task.manager.Tasks;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/details")
public class detailsServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Tasks task = DBManager.getTask(id);

        if (task != null) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("/details.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/404.jsp").forward(request, response);
        }
    }

}
