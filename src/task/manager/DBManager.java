package task.manager;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 4L;

    static {
        tasks.add(new Tasks(1L, "Создать веб приложение на JAVA EE", "Да", "2021-10-23", true));
        tasks.add(new Tasks(2L, "Убраться дома", "Да", "2021-10-24", true));
        tasks.add(new Tasks(3L, "Записаться на качку", "Нет", "2021-11-07", false));
    }

    public static void addTask(Tasks task) {
        task.setId(id);
        tasks.add(task);
        id++;
    }

    public static ArrayList<Tasks> getTasks() {
        return tasks;
    }

    public static Tasks getTask(long id) {
        for (Tasks task : tasks) {
            if (task.getId() == id) {
                return task;
            }
        }
        return null;
    }

    public static ArrayList<Tasks> getAllTasks() {
        return tasks;
    }

    public static void deleteTask(Long id) {
        for (int i = 0; i < tasks.size(); i++) {
            if (tasks.get(i).getId() == id) {
                tasks.remove(i);
                break;
            }
        }
    }

    public static Tasks updateTask(Tasks task) {
        for (int i = 0; i < tasks.size(); i++) {
            if (task.getId() == tasks.get(i).getId()) {
                tasks.set(i, task);
                return task;
            }
        }
        return null;
    }
}
