'use strict';
{
  // var ctx2 = document.getElementById('myChart2').getContext('2d');


  // var myLangChart = new Chart(ctx2,{
  //   type: 'doughnut',
  //   data: {
  //     labels: ['HTML','CSS','JavaScript','PHP','Laravel','SQL','SHELL','その他'],
  //     datasets: [{
  //       backgroundColor: ['#0345EC','#0F72BD','#20BDDE','#3DCEFE','#B29EF3','#6D46EC','#4A18EF','#3105C0'],
  //       data: [30,20,10,5,5,20,20,10],
  //     }]
  //   },
  //   options: {
  //     cutoutPercentage: 30,
  //     responsive: true,
  //     elements: {
  //       arc: {
  //         borderWidth: 0
  //       }
  //     },
  //     tooltips: {
  //       enabled: false
  //     },
  //     plugins: {
  //       legend: {
  //         display: false,
  //       },
  //       labels: {
  //         render: 'percentage',
  //         fontColor: 'white',
  //         fontSize: 20,
  //       }


  //     }
  //   }
  // });


  window.onload = function () {
    var data = [{
      data: [30,20,10,5,5,20,20,10],
      labels: ['HTML','CSS','JavaScript','PHP','Laravel','SQL','SHELL','その他'],
      backgroundColor: ['#0345EC','#0F72BD','#20BDDE','#3DCEFE','#B29EF3','#6D46EC','#4A18EF','#3105C0'],
      borderColor: "#fff"
    }];
    var options = {
      maintainAspectRatio: false,
      cutoutPercentage: 50,
      elements: {
        arc: {
          borderWidth: 0
        }
      },
      tooltips: {
        enabled: false
      },
      plugins: {
        datalabels: {
          formatter: (value, ctx) => {
            let datasets = ctx.chart.data.datasets;
            if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
              let sum = datasets[0].data.reduce((a, b) => a + b, 0);
              let percentage = Math.round((value / sum) * 100) + '%';
              return percentage;
            } else {
              return percentage;
            }
          },
          color: '#fff',
        }
      }
    };
    var ctx = document.getElementById("myChart2").getContext('2d');
    var myLangChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        datasets: data
      },
      options: options
    });


    var data = [{
      data: [40, 20, 40],
      labels: ['N予備校', 'ドットインストール', '課題'],
      backgroundColor: ['#0345EC', '#0F72BD', '#20BDDE'],
      borderColor: "#fff"
      
    }];
    var options = {
      maintainAspectRatio: false,
      cutoutPercentage: 50,
      elements: {
        arc: {
          borderWidth: 0
        }
      },
      tooltips: {
        enabled: false
      },
      plugins: {
        datalabels: {
          formatter: (value, ctx) => {
            let datasets = ctx.chart.data.datasets;
            if (datasets.indexOf(ctx.dataset) === datasets.length - 1) {
              let sum = datasets[0].data.reduce((a, b) => a + b, 0);
              let percentage = Math.round((value / sum) * 100) + '%';
              return percentage;
            } else {
              return percentage;
            }
          },
          color: '#fff',
        }
      }
    };
    var ctx = document.getElementById("myChart3").getContext('2d');
    var myContentChart = new Chart(ctx, {
      type: 'doughnut',
      data: {
        datasets: data
      },
      options: options
    });
  }

  
}