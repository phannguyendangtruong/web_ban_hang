

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ["SWE", "DEGREY", "HADES"],
        datasets: [{
            label: "Revenue",
            backgroundColor: "rgb(199, 80, 82)",
            borderColor: "rgb(199, 80, 82)",
            data: [10000, 5312, 6251],
        }],
    },
    options: {
        scales: {
            xAxes: [{
                time: {
                    unit: 'month'
                },
                gridLines: {
                    display: false
                },
                ticks: {
                    maxTicksLimit: 6
                }
            }],
            yAxes: [{
                ticks: {
                    min: 0,
                    max: 20000,
                    maxTicksLimit: 15
                },
                gridLines: {
                    display: true
                }
            }],
        },
        legend: {
            display: false
        }
    }
});