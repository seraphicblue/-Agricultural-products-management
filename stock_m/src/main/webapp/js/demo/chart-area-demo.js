// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

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
$(document).ready(function() {
		showmain();
		showmain2();
});

function showmain() {

	$.ajax({
		url: "/company/getmain",
		type: "GET"
	}).done(function(response) {
		console.log("showmain 호출");
		var parsedResponse = JSON.parse(response);
		var sellData = JSON.parse(parsedResponse.sellData);
		var buyData = JSON.parse(parsedResponse.buyData);


		console.log(sellData);
		console.log(buyData);
		getmaininfo(sellData, buyData);


	});

}


function showmain2() {
	$.ajax({
		url: "/normal/getmain",
		type: "GET"
	}).done(function(response) {
		console.log("showmain 호출");
		var parsedResponse = JSON.parse(response);
		var sellData = JSON.parse(parsedResponse.sellData);
		var buyData = JSON.parse(parsedResponse.buyData);


		console.log(sellData);
		console.log(buyData);
		getmaininfo(sellData, buyData);


	});
}



var formatter = new Intl.DateTimeFormat('en-US', {
	year: 'numeric',
	month: 'long',
	day: 'numeric'
});


// Area Chart Example
function getmaininfo(sellData, buyData) {

	var currentDate = new Date();
	var weekLabels = [];

	for (var i = 6; i >= 0; i--) {
		var date = new Date(currentDate);
		date.setDate(date.getDate() - i);

		weekLabels.push(formatter.format(date));
	}
	var ctx = document.getElementById("mymainChart");
	var sdates = [];
	var scs = [];
	var bdates = [];
	var bcs = [];

	buyData.forEach(function({ bdate, bc }) {
		bdates.push(formatter.format(bdate));
		bcs.push(bc);
	});
	sellData.forEach(function({ sdate, sc }) {
		sdates.push(formatter.format(sdate));
		scs.push(sc);
	});

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

	var mymainChart = new Chart(ctx, {

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
				data: purchaseData,
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
						maxTicksLimit: 5,
						padding: 10,
						// Include a dollar sign in the ticks
						callback: function(value, index, values) {
							return '' + number_format(value);
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
	});
}
