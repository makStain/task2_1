<%@ page import="java.util.ArrayList" %>
<%@ page import="task.manager.Tasks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!doctype html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Task Manager</title>
        <link rel="icon" href="img/icon.png" type="image/icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg" style="background-color: #1f1a62;">
            <div class="container-fluid">
                <a class="navbar-brand text-light" href="#"><b>TASK MANAGER</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active text-light" aria-current="page" href="/"><b>Все задания</b></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container" style="width: 95%; margin: auto; margin-top: 2%;">
            <%
                Tasks task = (Tasks) request.getAttribute("task");
            %>
            <form action="/updateTask" method="post">
                <input type="hidden" name="id" value="<%= task.getId() %>">
                <div class="mb-3">
                    <label for="name" class="form-label">Наименование : </label>
                    <input type="text" class="form-control" id="name" name="name" value="<%=task.getName()%>" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Описание : </label>
                    <textarea class="form-control" id="description" name="description" rows="3" required><%=task.getDescription()%></textarea>
                </div>
                <div class="mb-3">
                    <label for="deadlineDate" class="form-label">Крайний срок :</label>
                    <input type="date" class="form-control" id="deadlineDate" name="deadlineDate" value="<%=task.getDeadlineDate()%>" required>
                </div>
                <div class="mb-3">
                    <label for="status" class="form-label">Выполнено :</label>
                    <select class="form-control" id="status" name="status">
                        <option value="false" <%= !task.isStatus() ? "selected" : "" %>>Нет</option>
                        <option value="true" <%= task.isStatus() ? "selected" : "" %>>Да</option>
                    </select>
                </div>
                <button type="submit" class="btn text-light" style="background-color: #479f76">Сохранить</button>
                <button type="button" class="btn text-light" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color: #6a757e;">Удалить</button>
            </form>
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Удалить</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="/deleteTask" method="post">
                            <div class="modal-body">
                                <p>Вы уверены?</p>
                                <input type="hidden" name="id" value="<%= task.getId() %>">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Нет</button>
                                <button type="submit" class="btn btn-danger">Да</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
    </html>