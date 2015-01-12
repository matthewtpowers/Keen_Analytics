var client = new Keen({
  projectId: "53e2a957709a3937f2000002",
  readKey: "4215930a9b497fd9aa4c199e986f846b07f9fa6d8d9f0f16f26c23de3fa44c47320d3e145fc0b18d3771836c13227a31f72cfb2e3f3a64b3aa435973433ce9630db36becee258ec0eeb5bf028c92509f0dbfdd4d3f8539bbb811969adefe42b1eed9d8a7b9a37cf9787181e8999053d9"
}); 

Keen.ready(function(){

  var interval = "daily"
  var timeframe = "last_30_days"

  var bugs_2014 = new Keen.Query("sum", {
    eventCollection: "product_snapshot_final",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2014}]
  });

  var bugs_2013 = new Keen.Query("sum", {
    eventCollection: "product_snapshot_final",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2013}]
  });

  var bugs_2012 = new Keen.Query("sum", {
    eventCollection: "product_snapshot_final",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2012}]
  });


  var multi_query_bcm_2012_iOS = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.blocker"
    				},
    		   "bugs_critical": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.critical"
    				},
    			"bugs_major": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.major"
    				},
    			"bugs_total":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.total_bugs"
    				},
    			"bugs_invalid":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.invalid"
    				},
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2012},{"property_name":"platform","operator":"eq","property_value":"iOS"}]
  });

  var multi_query_bcm_2013_iOS = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.blocker"
    				},
    		   "bugs_critical": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.critical"
    				},
    			"bugs_major": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.major"
    				},
    			"bugs_total":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.total_bugs"
    				},
    			"bugs_invalid":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.invalid"
    				},
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2013},{"property_name":"platform","operator":"eq","property_value":"iOS"}]
  });

  var multi_query_bcm_2014_iOS = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.blocker"
    				},
    		   "bugs_critical": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.critical"
    				},
    			"bugs_major": {
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.major"
    				},
    			"bugs_total":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.total_bugs"
    				},
    			"bugs_invalid":
    				{
    					"analysis_type": "sum",
    					"target_property":
    					"bug_type.invalid"
    				},
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2014},{"property_name":"platform","operator":"eq","property_value":"iOS"}]
  });

   var multi_query_bcm_2012_Android = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.blocker"
            },
           "bugs_critical": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.critical"
            },
          "bugs_major": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.major"
            },
          "bugs_total":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.total_bugs"
            },
          "bugs_invalid":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.invalid"
            },
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


          },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2012},{"property_name":"platform","operator":"eq","property_value":"Android"}]
  });

  var multi_query_bcm_2013_Android = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.blocker"
            },
           "bugs_critical": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.critical"
            },
          "bugs_major": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.major"
            },
          "bugs_total":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.total_bugs"
            },
          "bugs_invalid":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.invalid"
            },
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


          },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2013},{"property_name":"platform","operator":"eq","property_value":"Android"}]
  });

  var multi_query_bcm_2014_Android = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"bugs_blocker": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.blocker"
            },
           "bugs_critical": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.critical"
            },
          "bugs_major": {
              "analysis_type": "sum",
              "target_property":
              "bug_type.major"
            },
          "bugs_total":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.total_bugs"
            },
          "bugs_invalid":
            {
              "analysis_type": "sum",
              "target_property":
              "bug_type.invalid"
            },
            "story_data.complexity_points":
            {
              "analysis_type": "sum",
              "target_property":
              "story_data.complexity_points"
            }


          },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2014},{"property_name":"platform","operator":"eq","property_value":"Android"}]
  });


client.run([bugs_2014, bugs_2013, bugs_2012], function(response){ // run the queries\
    var result2014 = response[0].result  // data from first query
    var result2013 = response[1].result  // data from second query
    var result2012 = response[2].result // data from the third query
   	
   	var data1 = result2012.concat(result2013);

    var data = data1.concat(result2014);

    //console.log("2014 data: " + result2014);

    /*while (i < result1.length) {

        data[i]={ // format the data so it can be charted
            timeframe: result1[i]["timeframe"],
            value: [
                { category: "Pageviews", result: result1[i]["value"] },
                { category: "Visitors", result: result2[i]["value"] }
            ]
        }
        if (i == result1.length-1) { // chart the data
            window.chart = new Keen.Visualization({result: data}, document.getElementById('pageviews'), {
                chartType: "linechart",
                title: " ",
                chartOptions: {
                    hAxis: {
                        format:'MMM d',
                        gridlines:  {count: 12}
                    }
                }
            });
        }
        i++;
    }*/

    //drawTotalBugsChart(data);
    
});

client.run([multi_query_bcm_2012_iOS,multi_query_bcm_2013_iOS,multi_query_bcm_2014_iOS,multi_query_bcm_2012_Android,multi_query_bcm_2013_Android,multi_query_bcm_2014_Android], function(response)
{
	console.log("In the multi-query function");
	var result_2012_iOS = response[0].result;
	var result_2013_iOS = response[1].result;
	var result_2014_iOS = response[2].result;
  var result_2012_Android = response[3].result;
  var result_2013_Android = response[4].result;
  var result_2014_Android = response[5].result;

	var data1 = result_2012_iOS.concat(result_2013_iOS);
  var data2 = data1.concat(result_2014_iOS);
  var data3 = data2.concat(result_2012_Android);
  var data4 = data3.concat(result_2013_Android);
  var data = data4.concat(result_2014_Android);
    
  //console.log(JSON.stringify(data));

  drawBCMBugs(data);
  drawBugsCP(data);
});

function drawBugsCP(results)
{
      var data = new google.visualization.DataTable();

      data.addColumn('number', 'X');
      data.addColumn('number', 'iOS');
      data.addColumn('number', 'Android');
      data.addColumn('number','Avg');

       var i = 0; 
      //There are 4 quarters, 0-3 -> iOS 2012, 
      var platform_offset = 12;
      console.log("Length: " + results.length);
      while (i < (results.length/2))
      {
        console.log("i: " + i);
        console.log("Data: " + JSON.stringify(results[i]));

        //iOS 
        bugs_total_iOS = results[i].bugs_total;
        bugs_invalid_iOS = results[i].bugs_invalid; 
        bugs_cp_iOS = results[i].story_data.complexity_points;
        //console.log("iOS Complexity Points: " + bugs_cp_iOS);
        bugs_total_iOS = bugs_total_iOS - bugs_invalid_iOS; 
        //console.log("iOS Total Bugs: " + bugs_total_iOS);
        ratio_iOS = bugs_total_iOS/bugs_cp_iOS;

        var android = i + platform_offset;

        //Android 
        bugs_total_android = results[android].bugs_total;
        bugs_invalid_android = results[android].bugs_invalid; 
        bugs_cp_android = results[android].story_data.complexity_points;
        console.log("Android Complexity Points: " + bugs_cp_android);
        bugs_total_android = bugs_total_android - bugs_invalid_android;
        console.log("Android Total Bugs: " + bugs_total_android);
        ratio_android = bugs_total_android/bugs_cp_android;

        ratio_avg = (ratio_android + ratio_iOS)/2 
        i++;
        data.addRow([i,1,ratio_android, 1]); 
      }

      var options = {
        width: 1000,
        height: 563,
        hAxis: {
          title: 'By Quarter',
          ticks: [{v:1,f:'2012 - Q1'}, {v:2,f:'2012 - Q2'}, {v:3,f:'2012 - Q3'}, {v:4,f:'2012 - Q4'},{v:5,f:'2013 - Q1'}, {v:6,f:'2013 - Q2'}, {v:7,f:'2013 - Q3'}, {v:8,f:'2013 - Q1'},
                  {v:9,f:'2014 - Q1'}, {v:10,f:'2013 - Q2'}, {v:11,f:'2013 - Q3'}, {v:12,f:'2013 - Q4'}],

          textStyle: {
            color: '#000000',
            fontSize: 12, 
            bold: true,
            italic: true
          },
          titleTextStyle: {
            color: '#000000',
            fontSize: 24,
            fontName: 'Arial',
            bold: false,
            italic: true
          }
        },
        vAxis: {
          title: 'Percentage',
          textStyle: {
            color: '#000000',
            fontSize: 18, 
            bold: true
          },
          titleTextStyle: {
            color: '#000000',
            fontSize: 24, 
            bold: true
          },
          gridlines: {color: '#333', count: 8}
        },
        colors: ['#097138', '#a52714','#0000FF'],
        trendlines: {
          0: {type: 'linear', color: '#000000', opacity: .4}
        }

      };
      var chart = new google.visualization.LineChart(document.getElementById('bugs_cp_chart'));

      chart.draw(data, options); 
      
}

function drawBCMBugs(results)
{
	  var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'iOS');
      data.addColumn('number', 'Android');
      data.addColumn('number','Avg');

      var options = {
        width: 1000,
        height: 563,
        hAxis: {
          title: 'Time'
        },
        vAxis: {
          title: 'Popularity'
        },
        series: {
          1: {curveType: 'function'}
        }
      };

      var i = 0; 
      //There are 4 quarters, 0-3 -> iOS 2012, 
      var platform_offset = 12;
      console.log("Length: " + results.length);
      while (i < (results.length/2))
      {
        //console.log("i: " + i);
      	//console.log("Data: " + JSON.stringify(results[i]));

        //iOS
      	bugs_major_iOS = results[i].bugs_major;
      	bugs_critical_iOS = results[i].bugs_critical;
      	bugs_blocker_iOS = results[i].bugs_blocker;
      	bugs_total_iOS = results[i].bugs_total;
      	bugs_invalid_iOS = results[i].bugs_invalid;
      	bugs_bcm_iOS = bugs_blocker_iOS + bugs_critical_iOS + bugs_major_iOS;
      	bugs_total_iOS = bugs_total_iOS - bugs_invalid_iOS;
      	ratio_iOS = bugs_bcm_iOS/bugs_total_iOS;

        var android = i + platform_offset;
        //Android
        bugs_major_android = results[android].bugs_major;
        bugs_critical_android = results[android].bugs_critical;
        bugs_blocker_android = results[android].bugs_blocker;
        bugs_total_android = results[android].bugs_total;
        bugs_invalid_android = results[android].bugs_invalid;
        bugs_bcm_android = bugs_blocker_android + bugs_critical_android + bugs_major_android;
        bugs_total_android = bugs_total_android - bugs_invalid_android;
        ratio_android = bugs_bcm_android/bugs_total_android;

        ratio_avg = (ratio_android + ratio_iOS)/2 
        i++;
        data.addRow([i,ratio_iOS,ratio_android, ratio_avg]); 
      }
      
       var options = {
        width: 1000,
        height: 563,
        hAxis: {
          title: 'By Quarter',
          ticks: [{v:1,f:'2012 - Q1'}, {v:2,f:'2012 - Q2'}, {v:3,f:'2012 - Q3'}, {v:4,f:'2012 - Q4'},{v:5,f:'2013 - Q1'}, {v:6,f:'2013 - Q2'}, {v:7,f:'2013 - Q3'}, {v:8,f:'2013 - Q1'},
                  {v:9,f:'2014 - Q1'}, {v:10,f:'2013 - Q2'}, {v:11,f:'2013 - Q3'}, {v:12,f:'2013 - Q4'}],

          textStyle: {
            color: '#000000',
            fontSize: 12, 
            bold: true,
            italic: true
          },
          titleTextStyle: {
            color: '#000000',
            fontSize: 24,
            fontName: 'Arial',
            bold: false,
            italic: true
          }
        },
        vAxis: {
          title: 'Percentage',
          textStyle: {
            color: '#000000',
            fontSize: 18, 
            bold: true
          },
          titleTextStyle: {
            color: '#000000',
            fontSize: 24, 
            bold: true
          },
          gridlines: {color: '#333', count: 8}
        },
        colors: ['#097138', '#a52714','#0000FF'],
        trendlines: {
          0: {type: 'linear', color: '#000000', opacity: .4}
        }

      };

      var chart = new google.visualization.LineChart(document.getElementById('bcm_chart'));

      chart.draw(data, options); 

}

function drawTotalBugsChart(results) { 
console.log("In draw chart");

	

  /*var data = google.visualization.arrayToDataTable([
    ['Quarter/Year', 'Bugs'],
    ['2004',  1000],
    ['2005',  1170],
    ['2006',  660],
    ['2007',  1030]
  ]);*/

var data = new google.visualization.DataTable();

// Declare columns
data.addColumn('string', 'N');
data.addColumn('number', 'Total Bugs (Valid and Invalid)');
data.addColumn({type: 'string', role: 'style'});


var i = 0;
var quarter = i;
var year_begin = 2012;

var twelve_color = 'color: #FF0000';
var thirteen_color = 'color: #FFFF00';
var fourteen_color = 'color: #009900';
var default_color = 'color: #009900';


console.log("Data Length: " + results.length);
while(i < results.length)
{ 
	quarter = quarter+1;
 
 	switch(year_begin)
 	{
 		case 2012:
 			default_color = twelve_color;
 		break;
 		case 2013:
 			default_color = thirteen_color;
 		break;
 		case 2014:
 			default_color = fourteen_color
 		break;
 	}
	data.addRow([year_begin + ":" + quarter.toString(), results[i].result,default_color])
	
	console.log("Quarter: " + quarter);
	if(quarter > 3)
	{
		console.log("Quarter is greater than 4");
		quarter = 0;
		year_begin = year_begin + 1;
	}

	i++;
}


  var options = {
    title: 'Bugs Per Quarter',
    hAxis: {
    	title: 'Year', 
    	titleTextStyle: {color: 'red'}, 
    	width: 600,
        height: 1400,

    	},
    vAxis: {gridlines:{color: '#333', count: 10}}
  };

  //Look at Material Design Charts at some point
  var chart = new google.visualization.ColumnChart(document.getElementById('my_chart'));

  chart.draw(data, options);
  console.log("Drawing chart");

}





});
 


