<?php

$dsn = 'mysql:dbname=posse;host=db';
$user = 'root';
$password = 'root';

$dbh = new PDO($dsn, $user,$password);

$sql_webapp = 'SELECT * FROM webapp';
$webapp = $dbh->query($sql_webapp)->fetchAll(PDO::FETCH_ASSOC);

$sql_contents = 'SELECT * FROM webapp_contents';
$webapp_contents = $dbh->query($sql_contents)->fetchAll(PDO::FETCH_ASSOC);

$sql_languages = 'SELECT * FROM webapp_languages';
$webapp_languages = $dbh->query($sql_languages)->fetchAll(PDO::FETCH_ASSOC);

foreach($webapp_contents as $key => $content) {
  $index = array_search($content["webapp_id"], array_column($webapp, 'id'));
  $webapp[$index]["contents"][] = $content;
}

foreach($webapp_languages as $key => $language) {
  $index = array_search($language["webapp_id"], array_column($webapp, 'id'));
  $webapp[$index]["languages"][] = $language;
}

// echo"<pre>";
// print_r($webapp);
// echo"</pre>";

class Study {
  public $day;
  public $hours;

  public function get_day() {
      return $this->day;
  }

  public function get_hours() {
      return (int)$this->hours;
  }
}



?>