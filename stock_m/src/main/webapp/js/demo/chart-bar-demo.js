   
        function search() {
        var start_date = document.getElementById('start-date-input').value;
        console.log(start_date);
        var end_date = document.getElementById('end-date-input').value;
        console.log(end_date);
    //window.location.href = `./finance/filtered_data?start_date=${start_date}&end_date=${end_date}`;}
        showSaledResult(start_date, end_date);
        }

    
   

    

   
       function resetSearch(){
			document.getElementById("chartform").reset()
			//location.assign("/company/getsdate")
			};

        

        $(function(){$("input[type='radio'][name='date']").on("change", function() {
            var dateRange = $(this).val();
            var startDate = "";
            var endDate = "";

            // dateRange에 따라 startDate와 endDate값을 설정합니다.
            switch (dateRange) {
                case "today":
                    startDate = new Date();
                    endDate = new Date();
                    break;
                case "1month":
                    startDate = new Date();
                    startDate.setMonth(startDate.getMonth() - 1);
                    endDate = new Date();
                    break;
                case "3month":
                    startDate = new Date();
                    startDate.setMonth(startDate.getMonth() - 3);
                    endDate = new Date();
                    break;
                case "1year":
                    startDate = new Date();
                    startDate.setFullYear(startDate.getFullYear() - 1);
                    endDate = new Date();
                    break;
            }

            var startYear = startDate.getFullYear();
            var startMonth = startDate.getMonth() + 1 < 10 ? "0" + (startDate.getMonth() + 1) : startDate.getMonth() + 1;
            var startDateNum = startDate.getDate() < 10 ? "0" + startDate.getDate() : startDate.getDate();
            var endYear = endDate.getFullYear();
            var endMonth = endDate.getMonth() + 1 < 10 ? "0" + (endDate.getMonth() + 1) : endDate.getMonth() + 1;
            var endDateNum = endDate.getDate() < 10 ? "0" + endDate.getDate() : endDate.getDate();

            var startDateStr = startYear + "-" + startMonth + "-" + startDateNum;
            var endDateStr = endYear + "-" + endMonth + "-" + endDateNum;

            showSaledResult(startDateStr, endDateStr);
        });
        });

        function showSaledResult(start, end) {
			$.ajax({
            url: "/company/getsdate",
            data: {
                "start-date": start,
                "end-date": end},
                type: "GET",
            }).done(function(response) {
				     
			    	 var parsedResponse = JSON.parse(response);
                     var filteredData = JSON.parse(parsedResponse.filteredData);
                     var buyData = JSON.parse(parsedResponse.buyData);
                     var totalData = JSON.parse(parsedResponse.totalData);
    
                     updateChart(filteredData, buyData, totalData);
                     console.log(filteredData);
                     console.log(buyData);
                     console.log(totalData);
			    	 
			    	
			    	});
             
            
       
        }

       -
        $("#saled").empty();
       $("#saled").append(table_data);
        

  $("#start-date-input, .test_obj").on("change", function() {
    if ($("#start-date-input").is(":checked")) {
      $(".test_obj").prop("checked", false).prop("disabled", true);
    } else {
      $(".test_obj").prop("disabled", false);
    }
  });

    
    
// Set new default font family and font color to mimic Bootstrap's default styling
//Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
//Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Bar Chart Example
//var= ${}
function updateChart(filteredData, buyData, totalData) {
  var ctx = document.getElementById('myChart');

  if (window.myBarChart) {
	  
    window.myBarChart.destroy();
  }

  var months = [];
  var sellPrices = [];
  var buyPrices = [];
  var profits = [];
  
  filteredData.forEach(function({ month, sell_price }) {
    months.push(month);
    sellPrices.push(sell_price);
  });

  buyData.forEach(function({ buy_price }) {
    buyPrices.push(buy_price);
  });

  totalData.forEach(function({ profit }) {
    profits.push(profit);
  });



var myBarChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels:months,
    datasets: [{
      label: "sell",
      backgroundColor: "#4e73df",
      hoverBackgroundColor: "#2e59d9",
      borderColor: "#4e73df",
      data: sellPrices,
    },
    {
      label: "buy",
      backgroundColor: "#4e73df",
      hoverBackgroundColor: "#2e59d9",
      borderColor: "#4e73df",
      data:buyPrices,
    },
    {
      label: "profit",
      backgroundColor: "#4e73df",
      hoverBackgroundColor: "#2e59d9",
      borderColor: "#4e73df",
      data:  profits,
    }],
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
          unit: 'month'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 6
        },
        maxBarThickness: 25,
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 15000,
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return number_format(value)+'원';
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
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': 원' + number_format(tooltipItem.yLabel);
        }
      }
    },
  }
});
window.myBarChart = myBarChart;
}