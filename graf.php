<?php
//$dataPoints = array(
//	array("y" => 25, "label" => "Sunday"),
//	array("y" => 15, "label" => "Monday"),
//	array("y" => 25, "label" => "Tuesday"),
//	array("y" => 5, "label" => "Wednesday"),
//	array("y" => 10, "label" => "Thursday"),
//	array("y" => 0, "label" => "Friday"),
//	array("y" => 20, "label" => "Saturday")
//);

$myfile = fopen("data/18_06_2018_temp.json", "r") or die("Unable to open file!");
$dataPoints = fread($myfile,filesize("data/18_06_2018_temp.json"));

?>
<!DOCTYPE HTML>
<html>
<head>
<script>
window.onload = function () {
 
var chart = new CanvasJS.Chart("chartContainer", {
	title: {
		text: "Temperature"
	},
	axisY: {
		title: "degree of celsius"
	},
	data: [{
		type: "line",
		markerSize: 0,
		xValueFormatString: "#,##0 °C",
		yValueFormatString: "#,##0.000 mPa·s",
		dataPoints: <?php echo "[".$dataPoints."]"; ?>
	}]
});
chart.render();
 
}
</script>
</head>
<body>
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html> 
<?php
fclose($myfile);
?>
