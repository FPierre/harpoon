$(document).ready(function() {
  // var percentCategories = {
  //   labels: ['javascript', 'ruby', 'devops', 'elasticsearch', 'linux mint'],
  //   datasets: [
  //     {
  //       fillColor:        "rgba(220,220,220,0.5)",
  //       strokeColor:      "rgba(220,220,220,1)",
  //       pointColor:       "rgba(220,220,220,1)",
  //       pointStrokeColor: "#fff",
  //       data:             [65, 59, 90, 81, 56]
  //     },
  //     {
  //       fillColor:        "rgba(151,187,205,0.5)",
  //       strokeColor:      "rgba(151,187,205,1)",
  //       pointColor:       "rgba(151,187,205,1)",
  //       pointStrokeColor: "#fff",
  //       data:             [28, 48, 40, 19, 96]
  //     }
  //   ]
  // }

  // chartPercentCategories = new Chart($('#chart-percent-categories').get(0).getContext('2d')).Line(percentCategories);

  var percentWebsites = [
    {
        value: 300,
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Red"
    },
    {
        value: 50,
        color: "#46BFBD",
        highlight: "#5AD3D1",
        label: "Green"
    },
    {
        value: 100,
        color: "#FDB45C",
        highlight: "#FFC870",
        label: "Yellow"
    }
  ];

  var myDoughnutChart = new Chart($('#chart-percent-websites').get(0).getContext('2d')).Doughnut(percentWebsites);
});
