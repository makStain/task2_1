package sprint.task.servlets;

import task.manager.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import task.manager.Tasks;

import java.io.IOException;

@WebServlet(value = "/updateTask")
public class updateTaskServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        Boolean status = Boolean.parseBoolean(req.getParameter("status"));

        Tasks task = new Tasks();

        task.setId(Long.valueOf(id));
        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadlineDate);
        task.setStatus(status);

        DBManager.updateTask(task);

        resp.sendRedirect("/home");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
