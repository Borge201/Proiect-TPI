<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

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
                <li><a href="index.html">Home</a></li>
                <li class="active"><a href="PaginaWorkouts.jsp">Workouts</a></li>
                <li><a href="PaginaNutrition.jsp">Nutrition</a></li>
                <li><a href="PaginaProgress.jsp">Tracker</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Workouts</h2>
        <form>
            <div>
                <label for="workout-name">Workout Name</label>
                <input type="text" id="workout-name" name="workout-name">
            </div>
            <div>
                <label for="workout-date">Workout Date</label>
                <input type="date" id="workout-date" name="workout-date">
            </div>
            <div>
                <label for="workout-time">Workout Time</label>
                <input type="time" id="workout-time" name="workout-time">
            </div>
            <div>
                <label for="workout-duration">Workout Duration (mins)</label>
                <input type="number" id="workout-duration" name="workout-duration">
            </div>
            <div>
                <label for="workout-type">Workout Type</label>
                <select id="workout-type" name="workout-type">
                    <option value="cardio">Cardio</option>
                    <option value="strength">Strength</option>
                    <option value="yoga">Yoga</option>
                </select>
            </div>
            <div>
                <label for="workout-description">Workout Description</label>
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
                <tr>
                    <td>Running</td>
                    <td>2023-04-25</td>
                    <td>06:30</td>
                    <td>30</td>
                    <td>Cardio</td>
                    <td>5 km run</td>
                </tr>
                <tr>
                    <td>Upper Body Workout</td>
                    <td>2023-04-26</td>
                    <td>16:00</td>
                    <td>60</td>
                    <td>Strength</td>
                    <td>Bench press, pull-ups, bicep curls</td>
                </tr>
                <tr>
                    <td>Yoga</td>
                    <td>2023-04-27</td>
<section class="workouts">
  <h2>Workouts</h2>
  <div class="add-workout">
    <h3>Add Workout</h3>
    <form>
      <div>
        <label for="workout-name">Workout Name:</label>
        <input type="text" id="workout-name" name="workout-name">
      </div>
      <div>
        <label for="workout-date">Date:</label>
        <input type="date" id="workout-date" name="workout-date">
      </div>
      <div>
        <label for="workout-time">Time (mins):</label>
        <input type="number" id="workout-time" name="workout-time" min="1">
      </div>
      <div>
        <label for="workout-calories">Calories Burned:</label>
        <input type="number" id="workout-calories" name="workout-calories" min="1">
      </div>
      <div>
        <button type="submit">Add</button>
      </div>
    </form>
  </div>
  <div class="workout-history">
    <h3>Workout History</h3>
    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>Workout</th>
          <th>Time (mins)</th>
          <th>Calories Burned</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>2022-05-01</td>
          <td>Running</td>
          <td>30</td>
          <td>200</td>
        </tr>
        <tr>
          <td>2022-05-02</td>
          <td>Cycling</td>
          <td>60</td>
          <td>500</td>
        </tr>
        <tr>
          <td>2022-05-03</td>
          <td>Swimming</td>
          <td>45</td>
          <td>400</td>
        </tr>
      </tbody>
    </table>
  </div>
</section>

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

 