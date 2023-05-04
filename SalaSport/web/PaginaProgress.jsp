<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Weight Progress and Food Tracking</title>
</head>
<body>
    <header>
        <h1>My Fitness Tracker</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="PaginaWorkouts.jsp">Workouts</a></li>
                <li class="active"><a href="PaginaProgress.jsp">Tracker</a></li>
                <li><a href="PaginaNutrition.jsp">Nutrition</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Weight Progress</h2>
        <form>
            <div>
                <label for="date">Date:</label>
                <input type="date" id="date">
            </div>
            <div>
                <label for="weight">Weight (kg):</label>
                <input type="number" id="weight" step="0.1" min="40" max="150">
            </div>
            <div>
                <label for="body-fat">Body Fat (%):</label>
                <input type="number" id="body-fat" step="0.1" min="5" max="50">
            </div>
            <button type="submit">Save</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Weight (kg)</th>
                    <th>Body Fat (%)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2023-05-01</td>
                    <td>68.5</td>
                    <td>23.5</td>
                </tr>
                <tr>
                    <td>2023-04-27</td>
                    <td>69.0</td>
                    <td>23.7</td>
                </tr>
                <tr>
                    <td>2023-04-23</td>
                    <td>69.5</td>
                    <td>24.0</td>
                </tr>
            </tbody>
        </table>
        <h2>Food Tracking</h2>
        <form>
            <div>
                <label for="food">Food:</label>
                <input type="text" id="food">
            </div>
            <div>
                <label for="calories">Calories:</label>
                <input type="number" id="calories" step="1" min="0">
            </div>
            <div>
                <label for="protein">Protein (g):</label>
                <input type="number" id="protein" step="0.1" min="0">
            </div>
            <button type="submit">Add</button>
        </form>
        <table>
            <thead>
                <tr>
                    <th>Food</th>
                    <th>Calories</th>
                    <th>Protein (g)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Chicken Breast</td>
                    <td>165</td>
                    <td>31.0</td>
                </tr>
                <tr>
                    <td>
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
