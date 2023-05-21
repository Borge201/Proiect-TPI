<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Fitness Tracker</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h1>Fitness Tracker</h1>
		<nav>
			<ul>
				<li><a href="#">Home</a></li>
				<li><a href="#">Workouts</a></li>
				<li><a href="#">Nutrition</a></li>
				<li><a href="#">Progress</a></li>
			</ul>
		</nav>
	</header>
	
	<main>
		<section class="hero">
			<h2>Get Fit</h2>
			<p>Track your fitness journey with our fitness tracker. Create custom workouts, monitor your nutrition, and track your progress.</p>
			<a href="#" class="cta">Get Started</a>
		</section>
		
		<section class="workouts">
			<h2>Workouts</h2>
			<p>Create custom workouts and track your progress.</p>
			<a href="#" class="cta">View Workouts</a>
		</section>
		
		<section class="nutrition">
			<h2>Nutrition</h2>
			<p>Monitor your nutrition with our food diary.</p>
			<a href="#" class="cta">View Food Diary</a>
		</section>
		
		<section class="progress">
			<h2>Progress</h2>
			<p>Track your progress with our fitness log.</p>
			<a href="#" class="cta">View Fitness Log</a>
		</section>
	</main>
	
	<footer>
		<p>&copy; 2023 Fitness Tracker. All rights reserved.</p>
	</footer>
</body>
</html>

<style>
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 0;
	}
	
	header {
		background-color: #333;
		color: #fff;
		display: flex;
		justify-content: space-between;
		align-items: center;
		padding: 1rem;
	}
	
	header h1 {
		margin: 0;
	}
	
	nav ul {
		list-style: none;
		margin: 0;
		padding: 0;
		display: flex;
		align-items: center;
	}
	
	nav li {
		margin: 0 1rem;
	}
	
	nav a {
		color: #fff;
		text-decoration: none;
	}
	
	.hero {
		background-color: #ccc;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding: 2rem;
		text-align: center;
	}
	
	.hero h2 {
		margin: 0;
		font-size: 3rem;
	}
	
	.hero p {
		margin: 0;
		font-size: 1.5rem;
		line-height: 2rem;
	}
	
	.cta {
		background-color: #333;
		color: #fff;
		display: inline-block;
		padding: 1rem 2rem;
		border-radius: 1rem;
		text-decoration: none;
		margin-top: 2rem;
	}
	
	.cta:hover {
		background-color: #444;
	}
	
	.workouts,
	.nutrition,
	.progress {
		display: flex;
		flex-direction: column;
		align
