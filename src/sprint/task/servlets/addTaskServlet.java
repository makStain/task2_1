package sprint.task.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import task.manager.DBManager;
import task.manager.Tasks;
import java.io.IOException;

@WebServlet(value = "/addTask")
public class addTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String deadlineDate = request.getParameter("deadlineDate");

        Tasks task = new Tasks(null, name,description, deadlineDate, false);
        DBManager.addTask(task);

        response.sendRedirect("/addTask?success");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/").forward(request, response);
    }
}
