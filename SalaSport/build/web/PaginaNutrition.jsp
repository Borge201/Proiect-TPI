<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Fitness Tracker - Nutrition</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <header>
        <h1>Fitness Tracker</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="PaginaWorkouts.jsp">Workouts</a></li>
                <li><a href="PaginaProgress.jsp">Tracker</a></li>
                <li class="active"><a href="PaginaNutrition.jsp">Nutrition</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Nutrition</h2>
        <p>Here you can view and manage your nutritional information.</p>
        <div class="nutrition-list">
            <div class="meal">
                <h3>Breakfast</h3>
                <p><strong>Calories:</strong> 350</p>
                <p><strong>Protein:</strong> 15g</p>
                <p><strong>Carbs:</strong> 40g</p>
                <p><strong>Fat:</strong> 10g</p>
                <a href="#" class="cta">Edit Meal</a>
            </div>
            <div class="meal">
                <h3>Lunch</h3>
                <p><strong>Calories:</strong> 500</p>
                <p><strong>Protein:</strong> 25g</p>
                <p><strong>Carbs:</strong> 50g</p>
                <p><strong>Fat:</strong> 20g</p>
                <a href="#" class="cta">Edit Meal</a>
            </div>
            <div class="meal">
                <h3>Dinner</h3>
                <p><strong>Calories:</strong> 600</p>
                <p><strong>Protein:</strong> 30g</p>
                <p><strong>Carbs:</strong> 60g</p>
                <p><strong>Fat:</strong> 25g</p>
                <a href="#" class="cta">Edit Meal</a>
            </div>
        </div>
        <a href="#" class="cta">Add New Meal</a>
    </main>
    <footer>
        <p>&copy; 2023 Fitness Tracker. All rights reserved.</p>
    </footer>
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

