<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    int x=7;
    String fName = "C:\\Users\\Mihai_i7\\Desktop\\SalaSport\\src\\java\\sala\\"+ x +".csv";
    String thisLine;
    List<String[]> workoutData = new ArrayList<String[]>();

    try {
        BufferedReader br = new BufferedReader(new FileReader(fName));
        while ((thisLine = br.readLine()) != null) {
            String[] rowData = thisLine.split(",");
            workoutData.add(rowData);
        }
        br.close();
    } catch (IOException e) {
        e.printStackTrace();
    }

    request.setAttribute("workoutData", workoutData);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Workouts</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Fitness Tracker</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li class="active"><a href="PaginaWorkouts.jsp">Workouts</a></li>
                <li><a href="PaginaProgress.jsp">Tracker</a></li>
                <li><a href="PaginaNutrition.jsp">Nutrition</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Workouts</h2>
        <form action="ServletFitnessTracker" method="POST">
    <div>
        <label for="workout-name">Workout Name:</label>
        <input type="text" id="workout-name" name="workout-name">
    </div>
    <div>
        <label for="workout-date">Workout Date:</label>
        <input type="date" id="workout-date" name="workout-date">
    </div>
    <div>
        <label for="workout-time">Workout Time:</label>
        <input type="time" id="workout-time" name="workout-time">
    </div>
    <div>
        <label for="workout-duration">Workout Duration (mins):</label>
        <input type="number" id="workout-duration" name="workout-duration">
    </div>
    <div>
        <label for="workout-type">Workout Type:</label>
        <select id="workout-type" name="workout-type">
            <option value="cardio">Cardio</option>
            <option value="strength">Strength</option>
            <option value="yoga">Yoga</option>
        </select>
    </div>
    <div>
        <label for="workout-description">Workout Description:</label>
        <input type="text" id="workout-description" name="workout-description">
    </div>
    <button type="submit">Add Workout</button>
</form>

        <table>
            <thead>
                <tr>
                    <th>Workout Name</th>
                    <th>Workout Date</th>
                    <th>Workout Time</th>
                    <th>Workout Duration (mins)</th>
                    <th>Workout Type</th>
                    <th>Workout Description</th>
                </tr>
            </thead>
            <tbody>
                <% for (String[] data : workoutData) { %>
                    <tr>
                        <td><%= data[0] %></td>
                        <td><%= data[1] %></td>
                        <td><%= data[2] %></td>
                        <td><%= data[3] %></td>
                        <td><%= data[4] %></td>
                        <td><%= data[5] %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </main>
</body>
</html>


<style>
     body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
}

header {
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    margin: 0;
}

nav ul {
    margin: 0;
    padding: 0;
    display: flex;
}

nav ul li {
    list-style: none;
}

nav ul li a {
    display: block;
    color: #fff;
    padding: 10px;
    text-decoration: none;
}

nav ul li a:hover {
    background-color: #ddd;
    color: #333;
}

nav ul li.active a {
    background-color: #ddd;
    color: #333;
}

main {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 5px;
}

h2 {
    margin-top: 0;
}

form {
    display: flex;
    flex-wrap: wrap;
}

form div {
    margin-right: 20px;
}

form div:last-child {
    margin-right: 0;
}

label {
    display: block;
    margin-bottom: 5px;
}

input[type="number"],
input[type="text"],
select {
    border: none;
    border-bottom: 1px solid #333;
    margin-top: 5px;
    margin-bottom: 10px;
    padding: 5px;
}

table {
    border-collapse: collapse;
    margin-top: 20px;
    margin-bottom: 20px;
}

table th,
table td {
    border: 1px solid #333;
    padding: 5px;
}

table th {
    background-color: #333;
    color: #fff;
}

table td:first-child {
    font-weight: bold;
}
<style>
 
