   function search() {
  var start_date = document.getElementById('start-date-input').value;
  console.log(start_date);
  var end_date = document.getElementById('end-date-input').value;
  console.log(end_date);
  showSaledResult(start_date, end_date);
}

function resetSearch() {
  document.getElementById("chartform").reset();
}

$(function() {
  $("input[type='radio'][name='date']").on("change", function() {
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
      "end-date": end
    },
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

$("#saled").empty();

function updateChart(filteredData, buyData, totalData) {
  var ctx = document.getElementById('myChart');

  if (window.myBarChart) {
    window.myBarChart.destroy();
  }

  var months = [];
  var sellPrices = [];
  var buyPrices = [];
  var profits = [];

  filteredData.forEach(function(data) {
    months.push(data.month);
    sellPrices.push(data.sell_price);
  });

 
  months.forEach(function(month) {
    var buyPrice = 0;
    var buyDataMonth = buyData.find(function(data) {
      return data.month == month;
    });

    if (buyDataMonth) {
      buyPrice = buyDataMonth.buy_price;
    }

    buyPrices.push(buyPrice);
  });

 
  months.forEach(function(month) {
    var profit = 0;
    var totalDataMonth = totalData.find(function(data) {
      return data.month == month;
    });

    if (totalDataMonth) {
      profit = totalDataMonth.profit;
    }

    profits.push(profit);
  });

  var myBarChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: months,
      datasets: [
        {
          label: "Sell Price",
          backgroundColor: "#4e73df",
          hoverBackgroundColor: "#2e59d9",
          borderColor: "#4e73df",
          data: sellPrices,
        },
        {
          label: "Buy Price",
          backgroundColor: "#e74a3b",
          hoverBackgroundColor: "#17a673",
          borderColor: "#e74a3b",
          data: buyPrices,
        },
        {
          label: "Profit",
          backgroundColor: "#1cc88a",
          hoverBackgroundColor: "#858796",
          borderColor: "#1cc88a",
          data: profits,
        },
      ],
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
        yAxes: [
          {
            id: 'price-axis',
            position: 'left',
            ticks: {
              min: 0,
              maxTicksLimit: 5,
              padding: 10,
              callback: function(value, index, values) {
                return number_format(value, 0) + '원';
              }
            },
            gridLines: {
              color: "rgb(234, 236, 244)",
              zeroLineColor: "rgb(234, 236, 244)",
              drawBorder: false,
              borderDash: [2],
              zeroLineBorderDash: [2]
            }
          },
        ],
      },
      legend: {
        display: true
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
            var value = tooltipItem.yLabel;
            var formattedValue = '';

            if (datasetLabel.includes("Price")) {
              formattedValue = number_format(value, 0) + '원';
            }
	
            if (tooltipItem.datasetIndex === 0 && tooltipItem.parsed.y !== null) {
              var salesChangePercentage = sellPriceChanges[tooltipItem.index];
              formattedValue += ' (' + salesChangePercentage + '%)';
            } else if (tooltipItem.datasetIndex === 1 && tooltipItem.parsed.y !== null) {
              var buyChangePercentage = buyPriceChanges[tooltipItem.index];
              formattedValue += ' (' + buyChangePercentage + '%)';
            }

            return datasetLabel + ': ' + formattedValue;
          }
        }
      },
    }
  });
  window.myBarChart = myBarChart;
}