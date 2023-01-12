<?php
include_once('./dbconnect.php');

$sql = 'SELECT SUM(hours) FROM webapp';
$total_hours = $dbh->query($sql)->fetch(pdo::FETCH_COLUMN);

$sql = 'SELECT hours FROM webapp where date = curdate()';
$today_hour = $dbh->query($sql)->fetch(pdo::FETCH_COLUMN);

// print_r($today_hour);

$sql = 'SELECT SUM(hours) from webapp where DATE_FORMAT(date, "%Y%m") = DATE_FORMAT(NOW(), "%Y%m")';
$month_hours = $dbh->query($sql)->fetch(pdo::FETCH_COLUMN);


$sql = "SELECT DATE_FORMAT(webapp.date,'%e') day, sum(webapp.hours) hours FROM webapp WHERE DATE_FORMAT(date, '%Y%m') = DATE_FORMAT(NOW(), '%Y%m') group by day";
$studies = $dbh->query($sql)->fetchAll(\PDO::FETCH_CLASS, Study::class);
$formatted_study_data = array_map(function ($study) {
  return [$study->get_day(), $study->get_hours()];
}, $studies);
$chart_data = json_encode($formatted_study_data);
// echo "<pre>";
// print_r($chart_data);
// echo "</pre>";
?>


<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>webapp</title>
  <script src="https://cdn.jsdelivr.net/npm/flatpickr" defer></script>
  <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js" defer></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
  <script src="./assets/js/script.js" defer></script>
  <!-- <script src="./assets/js/chart1.js" defer></script> -->
  
  <script src="./assets/js/chart2.js" defer></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" defer></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js" defer></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@0.4.0/dist/chartjs-plugin-datalabels.min.js" defer></script>
  <!-- <script src="./assets/js/calendar.js" defer></script> -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP&family=Poppins&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <link rel="stylesheet" href="./assets/css/reset.css">
  <link rel="stylesheet" href="./assets/css/style.css">
  
  
</head>

<body>
  <header>
    <div class="header-inner">
      <div class="header-outer">
        <div class="header-logo"><img src="./assets/img/logo.svg" alt="posse"></div>
        <div class="header-week">4th week</div>
      </div>
      <div class="header-button" id="modalButton">記録・投稿</div>
    </div>
  </header>

  <main>
    <div class="main-inner">
      <div class="main-inner-date small outer">
        <h1>Today</h1>
        <p class="main-inner-number"><?= $today_hour ?></p>
        <p class="main-inner-hour">hour</p>
      </div>
      <div class="main-inner-month small outer">
        <h1>Month</h1>
        <p class="main-inner-number"><?= $month_hours ?></p>
        <p class="main-inner-hour">hour</p>
      </div>
      <div class="main-inner-total small outer">
        <h1>Total</h1>
        <p class="main-inner-number"><?= $total_hours ?></p>
        <p class="main-inner-hour">hour</p>
      </div>
      <div class="main-inner-graph graph outer">
        <div class="canvas-container">
          <canvas id="myChart1"></canvas>
        </div>
      </div>
      <div class="main-inner-lang circle outer">
        <h1>学習言語</h1>
        <div class="canvas-container-circle">
          <canvas id="myChart2"></canvas>
        </div>
        <div class="main-inner-item">
          <p class="item1">HTML</p>
          <p class="item2">CSS</p>
          <p class="item3">JavaScript</p>
          <p class="item4">PHP</p>
          <p class="item5">Laravel</p>
          <p class="item6">SQL</p>
          <p class="item7">SHELL</p>
          <p class="item8">情報システム基礎知識（その他）</p>
        </div>
      </div>
      <div class="main-inner-content circle outer">
        <h1>学習コンテンツ</h1>
        <div class="canvas-container-circle">
          <canvas id="myChart3"></canvas>
        </div>
        <div class="main-inner-item content">
          <p class="item1">N予備校</p>
          <p class="item2">ドットインストール</p>
          <p class="item3">課題</p>
        </div>
      </div>
    </div>


    <div id="modalMask" class="hidden"></div>
    <section class="main-modal hidden" id="modalWindow">
      <div class="main-modal-close-outer" id="modalClose">
        <span class="main-modal-close"></span>
      </div>
      <form action="#" method="post" id="mainForm">
        <div class="main-modal-wrapper">
          <div class="main-modal-left">
            <div>
              <h2>学習日</h2>
              <input type="text" name="datepicker" id="js-datepicker">
            </div>
            <div class="main-modal-content">
              <h2>学習コンテンツ（複数選択可）</h2>
              <input type="checkbox" id="01-A" name="content">
              <label for="01-A" class="modal-checkbox">N予備校</label>
              <input type="checkbox" id="01-B" name="content">
              <label for="01-B" class="modal-checkbox">ドットインストール</label>
              <input type="checkbox" id="01-C" name="content">
              <label for="01-C" class="modal-checkbox">POSSE課題</label>
            </div>
            <div class="main-modal-lang">
              <h2>学習言語（複数選択可）</h2>
              <input type="checkbox" id="02-A" name="lang">
              <label for="02-A" class="modal-checkbox">HTML</label>
              <input type="checkbox" id="02-B" name="lang">
              <label for="02-B" class="modal-checkbox">CSS</label>
              <input type="checkbox" id="02-C" name="lang">
              <label for="02-C" class="modal-checkbox"><input type="checkbox" name="lang">JavaScript</label>
              <input type="checkbox" id="02-D" name="lang">
              <label for="02-D" class="modal-checkbox">PHP</label>
              <input type="checkbox" id="02-E" name="lang">
              <label for="02-E" class="modal-checkbox">Laravel</label>
              <input type="checkbox" id="02-F" name="lang">
              <label for="02-F" class="modal-checkbox">SQL</label>
              <input type="checkbox" id="02-G" name="lang">
              <label for="02-G" class="modal-checkbox">SHELL</label>
              <input type="checkbox" id="02-H" name="lang">
              <label for="02-H" class="modal-checkbox">情報システム基礎知識（その他）</label>
            </div>
          </div>
          <div class="main-modal-right">
            <div>
              <h2>学習時間</h2>
              <input type="text" name="time">
            </div>
            <div>
              <h2>Twitter用コメント</h2>
              <textarea name="comment" id="twitterComment" cols="30" rows="10"></textarea>
            </div>
            <div class="main-modal-share">
              <input type="checkbox" id="03-A" name="twitter">
              <label for="03-A" class="modal-checkbox-twitter"></label>
              <p>Twitterにシェアする</p>
            </div>
          </div>
        </div>
        <div class="main-modal-button-outer">
          <button type="button" class="main-modal-button" id="mainModalButton">記録・投稿</button>
        </div>
      </form>

      <div class="main-loader-outer" id="mainLoader">
        <div class="main-loader"></div>
      </div>

      <div class="main-record" id="mainRecord">
        <h3>AWESOME!</h3>
        <span class="main-record-check"></span>
        <p>記録・投稿<br>完了しました</p>
      </div>
    </section>

    <!-- カレンダー作成 -->

    <!-- <div class="main-calendar">
      <table>
        <thead>
          <tr>
            <th id="prev">&laquo;</th>
            <th id="title" colspan="5" class="main-calendar-title">2022年10月</th>
            <th id="next">&raquo;</th>
          </tr>
          <tr>
            <th>Sun</th>
            <th>Mon</th>
            <th>Tue</th>
            <th>Wed</th>
            <th>Thu</th>
            <th>Fri</th>
            <th>Sat</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
      <button id="prev" type="button">前の月</button>
      <button id="next" type="button">次の月</button>
      <div class="main-calendar-inner" id="mainCalendar"></div>
    </div> -->


    <div class="main-error">
      <h3>ERROR</h3>
      <span class="main-error-mark">!</span>
      <p>一時的にご利用できない状況です。<br>しばらく経ってから<br>再度アクセスしてください。</p>
    </div>

    <div class="main-date-inner">
      <p class="main-date">2022年 01月</p>
    </div>



  </main>

  <footer></footer>
</body>
<script>
{
  let chart_data = <?php echo $chart_data; ?>;
  const transpose = a => a[0].map((_, c) => a.map(r => r[c]));
  data = transpose(chart_data);
  // console.log(data)
  var ctx = document.getElementById('myChart1').getContext('2d');

  var blue_gradient = ctx.createLinearGradient(0, 0, 0, 500);
  blue_gradient.addColorStop(0, '#3CCFFF');
  blue_gradient.addColorStop(1, '#0F72BD');

  var myGraphChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: data[0],
      datasets: [{
        label: "学習時間",
        data: data[1],
        backgroundColor: blue_gradient,
        barPercentage: 0.6,
        borderRadius: 5,
        
      }],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false,
        },
      },
      scales: {
        x: {
          grid: {
            drawBorder: false,
            drawOnChartArea: false,
            drawTicks: false,
          },
          ticks: {
            padding: 10,
            color: '#97B9D0',
            beginAtZero: true,
            maxTicksLimit: 30,
            stepSize: 2,
            scaleFontSize: 40,
            maxTicksLimit: 30
          }
        },
        y: {
          grid: {
            drawBorder: false,
            drawOnChartArea: false,
            drawTicks: false,
          },
          ticks: {
            padding: 10,
            stepSize: 2,
            color: '#97B9D0',
            beginAtZero: true,
            callback: function (value, index, values) {
              return value + 'h';
            },
          }
        }
      }
    }
  });
}
</script>




</html>