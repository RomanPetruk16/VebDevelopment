<?php

echo 1;
$first_name = "Микола";
$last_name = "Петренко";
$year_of_birth = 2000;
$current_year = date("Y");
$age = $current_year - $year_of_birth;
echo "Повне ім’я: $first_name $last_name<br>";
echo "Вік: $age років<br><br>";
$countries = ["Україна","Франція","Японія","Канада"];
echo "<ol>";
foreach($countries as $country){
 echo"<li>$country</li>";
}
echo "</ol><br>";
$cities = [
    "Київ" => 2967000,
    "Львів" => 721301,
    "Харків" => 1431000,
    "Одеса" => 1011000
];
echo"Міста з населенням понад один млн:<br>";
foreach($cities as $city => $population){
 if($population > 1000000){
   echo "$city: $population<br>";
  }
}
echo "<br>";
$number = 8;
if($number % 2 == 0){
 echo "$number - Парне числ<br><br>;
} else {
 echo "$number - Непарне число<br><br>;
}
$year = date("Y");
if ($year % 4 == 0) {
    echo "$year — Високосний рік";
} else {
    echo "$year — Не є високосним роком";
}
?>