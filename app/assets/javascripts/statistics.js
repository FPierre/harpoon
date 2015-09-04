// $(document).on('ready page:load', function() {

$(document).ready(function() {
  // var percentCategoriesDays = {
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

  var percentCategories = $('.controller-data').data('percent-categories');
  var options = { segmentShowStroke: false };
  var myDoughnutChart = new Chart($('#chart-percent-categories').get(0).getContext('2d')).Doughnut(percentCategories, options);

  var percentCategoriesDays = $('.controller-data').data('percent-categories-days');
  var myLineChart = new Chart($('#chart-percent-categories-days').get(0).getContext('2d')).Line(percentCategoriesDays);

  var percentCategoriesWebsites = $('.controller-data').data('percent-categories-websites');
  var myBarChart = new Chart($('#chart-percent-categories-websites').get(0).getContext('2d')).Line(percentCategoriesWebsites);
});
