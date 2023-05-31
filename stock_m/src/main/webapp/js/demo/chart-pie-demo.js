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
  //도넛
  var s_volumes = [];
  var scontents = [];
  stocklist.forEach(function({s_volume , scontent }) {
    s_volumes.push(s_volume);
    scontents.push(scontent);
  });
  
 var backgroundColors = generateColors(scontents.length); // 색상을 동적으로 생성
  
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: scontents,//stock name
    datasets: [{
      data: s_volumes,//stock 양
      backgroundColor: backgroundColors,
      hoverBackgroundColor: backgroundColors,
      hoverBorderColor: "rgba(234, 236, 244, 1)",
     }
    ],
  },
  options: {
    maintainAspectRatio: false,
    responsive: true,
    onClick: function(event, elements) {//이벤트객체,요소의 배열생성
   
    if (elements.length > 0) {
     
      var clickedElement = elements[0];//클릭요소 정보 담기
      var dataIndex = clickedElement._index;//_index는 Chart.js 라이브러리에서 내부적으로 사용되는 인덱스 속성
      var label = myPieChart.data.labels[dataIndex];//인덱스 라벨가져오기
      var value = myPieChart.data.datasets[0].data[dataIndex];//인덱스로 배열값 접근
      
      // 예시: 클릭한 요소의 라벨과 값 출력
      console.log("Clicked:", label, value);//scontent,s_volume
      
      var encodedLabel = encodeURIComponent(label);
      var url = "/company/search?search=" + encodedLabel;
      
      $.ajax({
            url: url,
            type: "GET",
            
            }).done(function(response) {
				 window.location.href = "/company/search?search=" + encodedLabel;
				     console.log("도넛클릭이벤트 성공");
			    	

                    

                  

			    	});


    }
    
  },
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
 appendToCanvas(ctx, scontents, backgroundColors);
}
//1차
// Canvas에 동적으로 추가하는 함수
function appendToCanvas(ctx, scontents, backgroundColors) {
    var chartPie = ctx.parentNode;

    for (var i = 0; i < scontents.length; i++) {
      var span = document.createElement("span");
      span.className = "mr-2";

      var icon = document.createElement("i");
      icon.className = "fas fa-circle";
      icon.style.color = backgroundColors[i];

      var text = document.createTextNode(scontents[i]);

      span.appendChild(icon);
      span.appendChild(text);

      chartPie.appendChild(span);
    }
  }

  // JSP로부터 전달된 값으로 Canvas에 동적으로 추가
 


// 색상을 동적으로 반환하는 함수
function generateColors(length) {
  
  
 var colors = [
    '#4e73df','#224abe','#13855c','#1cc88a', '#36b9cc', '#258391','#f6c23e','#dda20a', '#e74a3b','#e74a3b'
  ];
  var backgroundColors = [];
  for (var i = 0; i < length; i++) {
   var colorIndex = i % colors.length;
    backgroundColors.push(colors[colorIndex]);
  }
  
  return backgroundColors;

}





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

//2차 날짜포멧
var formatter = new Intl.DateTimeFormat('en-US', {
  year: 'numeric',
  month: 'long',
  day: 'numeric'
});

//2차
function getStockInfo(sellcountdate,buycountdate) {
var currentDate = new Date();
var weekLabels = [];

for (var i = 6; i >= 0; i--) {
  var date = new Date(currentDate);
  date.setDate(date.getDate() - i);
 
  weekLabels.push(formatter.format(date));
}
	var ctx = document.getElementById("myAreaChart");
	
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