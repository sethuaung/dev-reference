<?php

$conn = "";

try {
	$servername = "localhost:3306";
	$dbname = "felixentweb";
	$username = "root";
	$password = "P@ssw0rd";

	$conn = new PDO(
		"mysql:host=$servername; dbname=felixentweb",
		$username, $password
	);
	
$conn->setAttribute(PDO::ATTR_ERRMODE,
					PDO::ERRMODE_EXCEPTION);
}
catch(PDOException $e) {
	echo "Connection failed: " . $e->getMessage();
}

?>
