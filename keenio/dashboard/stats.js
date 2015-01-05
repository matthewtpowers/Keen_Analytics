var client = new Keen({
  projectId: "53e2a957709a3937f2000002",
  readKey: "4215930a9b497fd9aa4c199e986f846b07f9fa6d8d9f0f16f26c23de3fa44c47320d3e145fc0b18d3771836c13227a31f72cfb2e3f3a64b3aa435973433ce9630db36becee258ec0eeb5bf028c92509f0dbfdd4d3f8539bbb811969adefe42b1eed9d8a7b9a37cf9787181e8999053d9"
}); 

Keen.ready(function(){

  var interval = "daily"
  var timeframe = "last_30_days"

  var bugs_2014 = new Keen.Query("sum", {
    eventCollection: "product_snapshot",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2014}]
  });

  var bugs_2013 = new Keen.Query("sum", {
    eventCollection: "product_snapshot",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2013}]
  });

  var bugs_2012 = new Keen.Query("sum", {
    eventCollection: "product_snapshot",
    targetProperty: "bug_type.total_bugs",
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2012}]
  });


  var multi_query_bcm_2012 = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot",
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
    				}


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2012}]
  });

  var multi_query_bcm_2013 = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot",
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
    				}


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2013}]
  });

  var multi_query_bcm_2014 = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot",
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
    				}


    		  },
    groupBy: "quarter",
    filters: [{"property_name":"start_year","operator":"eq","property_value":2014}]
  });


client.run([bugs_2014, bugs_2013, bugs_2012], function(response){ // run the queries\
    var result2014 = response[0].result  // data from first query
    var result2013 = response[1].result  // data from second query
    var result2012 = response[2].result // data from the third query
   	
   	var data1 = result2012.concat(result2013);

    var data = data1.concat(result2014);

    //console.log("Combined Data: " + JSON.stringify(data));
/*
    while (i < result1.length) {

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

client.run([multi_query_bcm_2012,multi_query_bcm_2013,multi_query_bcm_2014], function(response)
{
	console.log("In the multi-query function");
	var result_2012 = response[0].result;
	var result_2013 = response[1].result;
	var result_2014 = response[2].result;

	var data1 = result_2012.concat(result_2013);

    var data = data1.concat(result_2014);
    
    //console.log(JSON.stringify(result_2012));

    drawBCMBugs(data);
});

function drawBCMBugs(results)
{
	  var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', 'Dogs');
      data.addColumn('number', 'Cats');

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
      console.log("starting loop");
      while (i < results.length)
      {
      	console.log("Data: " + JSON.stringify(results[i]));
      	bugs_major = results[i].bugs_major;
      	bugs_critical = results[i].bugs_critical;
      	console.log("Critical Bugs: " + bugs_critical);
      	bugs_blocker = results[i].bugs_blocker;
      	bugs_total = results[i].bugs_total;
      	bugs_invalid = results[i].bugs_invalid;
      	bugs_bcm = bugs_blocker + bugs_critical + bugs_major;
      	bugs_total = bugs_total - bugs_invalid;
      	ratio = bugs_bcm/bugs_total;
      	console.log("Quarter: " + results[i].quarter);
      	console.log("Ratio: " + ratio);
      	i++;
      	//data.addRow([year_begin + ":" + quarter.toString(), results[i].result,default_color])
      }
      
      //var chart = new google.visualization.LineChart(document.getElementById('ex2'));

      //chart.draw(data, options);

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
 


