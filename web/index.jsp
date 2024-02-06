<%@ page import="java.util.ArrayList" %>
<%@ page import="task.manager.Tasks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!doctype html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Task Manager</title>
        <link rel="icon" href="img/icon.png" type="image/icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            .number {
                width: 6%;
            }
            .name {
                width: 55%;
            }
        </style>
    </head>
    <body>

    <nav class="navbar navbar-expand-lg" style="background-color: #1f1a62;">
        <div class="container-fluid">
            <a class="navbar-brand text-light" href="/"><b>TASK MANAGER</b></a>
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
    <br>
    <main style="width: 95%; margin: auto; margin-top: 2%;">
        <form action="/addTask" method="post">
            <!-- Button trigger modal -->
            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: #1f1a62; color: white;">
                + Добавить задание
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Новое задание</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Наименование :</label>
                                    <input name="name" type="text" class="form-control" id="exampleFormControlInput1" placeholder="Наименование..." required>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Описание :</label>
                                    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Описание..." required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Крайний срок :</label>
                                    <input name="deadlineDate" type="date" class="form-control" id="exampleFormControlInput2" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            <button class="btn btn-success text-light">Добавить</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>

        <br>

        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th class="number" scope="col">ID</th>
                <th class="name" scope="col">Наименование</th>
                <th scope="col">Крайний срок</th>
                <th scope="col">Выполнено</th>
                <th scope="col">Детали</th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
                    <%
                        ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
                        if (tasks != null) {
                            for (Tasks task : tasks) {
                    %>
                    <tr>
                        <th class="number" scope="row">
                            <%=task.getId()%>
                        </th>
                        <td class="name">
                            <%=task.getName()%>
                        </td>
                        <td>
                            <%=task.getDeadlineDate()%>
                        </td>
                        <td>
                            <%=task.isStatus()?"Да":"Нет"%>
                        </td>
                        <td>
                            <a href="/details?id=<%=task.getId()%>"><button type="button" class="btn" style="background-color: #1f1a62; color: white;">Детали</button></a>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
            </tbody>
        </table>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
    </html>