// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

               
//1차 처음에 도넛데이터 불러오기         
$(document).ready(function() {
  showStockResult();
});

//1차 도넛 ajax
function showStockResult() {
			$.ajax({
            url: "/company/getstock",
            type: "GET",
            }).done(function(response) {
				     console.log("stocklist");
			    	var stocklist = JSON.parse(response);

                    console.log(stocklist);
                    stockChart(stocklist);


			    	});



        }

//1차 도넛그래프 그리는 function 재고이름, 재고량
function stockChart(stocklist){

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
//console.log(window.myPieChart);
 /*if (window.myPieChart) {
    window.myPieChart.destroy();
  }*/
  var s_volumes = [];
  var scontents = [];
  stocklist.forEach(function({s_volume , scontent }) {
    s_volumes.push(s_volume);
    scontents.push(scontent);
  });
  
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: scontents,//stock name
    datasets: [{
      data: s_volumes,//stock 양
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

//2차 그래프 안에서 재고 선택시 onchange
   $(function(){$("[name='selectedStock']").on("change", function() {
		var selectedsno=$(this).val();
           console.log(selectedsno)
       
			$.ajax({
            url: "/company/getStockInfos",
            data: {
				"selectedsno": selectedsno 
               },
            type: "GET"
            }).done(function(response) {
				     console.log("changeevent 호출");
				     var parsedResponse = JSON.parse(response);
                     var sellcountdate =JSON.parse(parsedResponse.sellcountdate);
                     var buycountdate = JSON.parse(parsedResponse.buycountdate);
			    	
                    
                    console.log(sellcountdate);
                    console.log(buycountdate);
                    getStockInfo(sellcountdate,buycountdate);
			    	 
			    	
			    	});
             
            
       
        
           firstResult(selectedsno);

        });
        });
}
/////////////////////////////////
var formatter = new Intl.DateTimeFormat('en-US', {
  year: 'numeric',
  month: 'long',
  day: 'numeric'
});
 ///////////////////////////////////////
//2차
function getStockInfo(sellcountdate,buycountdate) {
var currentDate = new Date();
// Create an array to store the labels for the past week
var weekLabels = [];
// Loop through the past 7 days and format the dates
for (var i = 6; i >= 0; i--) {
  var date = new Date(currentDate);
  date.setDate(date.getDate() - i);
  // Format the date and push it to the labels array
  weekLabels.push(formatter.format(date));
}
	var ctx = document.getElementById("myAreaChart");
	console.log("11111111111111111 요청 성공");
	console.log(sellcountdate);
	console.log(buycountdate);
	
	var sdates=[];
	var scs=[];
	var bdates=[];
	var bcs=[];
	
    sellcountdate.forEach(function({ sdate, sc }) {
    sdates.push(formatter.format(sdate));
    console.log("여기임");
    console.log(sdate);
    console.log(formatter.format(sdate));
    scs.push(sc);
  });
    buycountdate.forEach(function({ bdate, bc }) {
    bdates.push(formatter.format(bdate));
    bcs.push(bc);
  });

//console.log(sellcountobj.sdate);
//console.log(sellcountobj.sc);
if (window.myLineChart) {
	  
    window.myLineChart.destroy();
  }
var salesData = [];
var purchaseData = [];

// Loop through the past 7 days and check if there is data available
for (var i = 6; i >= 0; i--) {
  var date = new Date(currentDate);
  date.setDate(date.getDate() - i);
  var formattedDate = formatter.format(date);

  // Check if there is sales data available for the current date
  var salesIndex = sdates.indexOf(formattedDate);
  if (salesIndex !== -1) {
    // Sales data exists for the current date, add it to the salesData array
    salesData.push(scs[salesIndex]);
  } else {
    // No sales data available for the current date, add 0
    salesData.push(0);
  }

  // Check if there is purchase data available for the current date
  var purchaseIndex = bdates.indexOf(formattedDate);
  if (purchaseIndex !== -1) {
    // Purchase data exists for the current date, add it to the purchaseData array
    purchaseData.push(bcs[purchaseIndex]);
  } else {
    // No purchase data available for the current date, add 0
    purchaseData.push(0);
  }
}
var myLineChart = new Chart(ctx, {
	
  type: 'line',
  data: {
    labels: weekLabels, 
    datasets: [{
      label: "판매량",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: salesData,
    },
    {
      label: "구매량",
      lineTension: 0.3,
      backgroundColor: "rgba(231, 76, 60, 0.05)",
      borderColor: "rgba(231, 76, 60, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(231, 76, 60, 1)",
      pointBorderColor: "rgba(231, 76, 60, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(231, 76, 60, 1)",
      pointHoverBorderColor: "rgba(231, 76, 60, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: purchaseData ,
    } ],
   
   
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
		beginAtZero: true,
          maxTicksLimit: 5,
          padding: 10,
          
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
			  if (value === Math.floor(value)) {
          return value; // Display the integer value
        }
            //return '' + number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': ' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
  

})



window.myLineChart = myLineChart;}