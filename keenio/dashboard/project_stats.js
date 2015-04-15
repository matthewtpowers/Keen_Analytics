var client = new Keen({
  projectId: "53e2a957709a3937f2000002",
  readKey: "4215930a9b497fd9aa4c199e986f846b07f9fa6d8d9f0f16f26c23de3fa44c47320d3e145fc0b18d3771836c13227a31f72cfb2e3f3a64b3aa435973433ce9630db36becee258ec0eeb5bf028c92509f0dbfdd4d3f8539bbb811969adefe42b1eed9d8a7b9a37cf9787181e8999053d9"
}); 

function loadup(id)
{
  console.log("Load Project: " + id); 

  var project_data = new Keen.Query("multi_analysis", {
    eventCollection: "product_snapshot_final",
    analyses: {"dev": {
              "analysis_type": "select_unique",
              "target_property":
              "team_data.dev"
            },
           "design": {
              "analysis_type": "select_unique",
              "target_property":
              "team_data.design"
            },
          "qa": {
              "analysis_type": "select_unique",
              "target_property":
              "team_data.qa"
            },
          "product": {
              "analysis_type": "select_unique",
              "target_property":
              "team_data.product"
           },
          "total_bugs": {
              "analysis_type": "select_unique",
              "target_property":
              "bug_type.total_bugs"
           },
           "critical_bugs": {
              "analysis_type": "select_unique",
              "target_property":
              "bug_type.critical"
           },
           "major_bugs": {
              "analysis_type": "select_unique",
              "target_property":
              "bug_type.major"
           },
           "design_bugs": {
              "analysis_type": "select_unique",
              "target_property":
              "bug_type.design"
           },
           "cp": {
              "analysis_type": "select_unique",
              "target_property":
              "story_data.complexity_points"
           },
           "reopened_stories": {
              "analysis_type": "select_unique",
              "target_property":
              "story_data.reopened_stories"
           }
           
         },
    groupBy: "keen.timestamp",
    filters: [{"property_name":"product","operator":"eq","property_value":id}]
  });

  client.run([project_data], function(response){ // run the queries\
    data = response.result  // data from first query
    console.log("Client Data: " + JSON.stringify(data));
    drawTotalStats(data, id);   
    });
}

function drawTotalStats(data, id)
{
  var holder = document.getElementById('project_title');
  holder.innerHTML = id;
  
  total_bugs = 0;
  critical_bugs = 0;
  major_bugs = 0;
  design_bugs = 0;

  test_case_total = "N/A";
  test_case_passed = "N/A";
  test_case_failed = "N/A";

  cp_total = 0;

  for(i=0; i < data.length; i++)
  {
    console.log("Total Bugs:" + data[i].total_bugs);
    total_bugs += data[i].total_bugs;
    console.log("Design Bugs: " + data[i].design_bugs);
    design_bugs += data[i].design_bugs;
    console.log("Major Bugs: " + data[i].major_bugs);
    major_bugs += data[i].major_bugs;
    console.log("Critical Bugs: " + data[i].critical_bugs);
    critical_bugs += data[i].critical_bugs;
    console.log("Complexity Points: " + data[i].cp);
    cp += cp[i].cp;

  }



}

function drawCharts()
{

}

Keen.ready(function(){

  var projects = [];
 

  var projects = new Keen.Query("select_unique", {
    eventCollection: "product_snapshot_final",
    targetProperty: "product",
    groupBy: "start_year"
  });




client.run([projects], function(response){ // run the queries\
    projects = response.result  // data from first query
    //Probably can do this with Keen
    projects.reverse();
    //drawTotalBugsChart(data);
    loadProjectData();
    drawProjects();
    
});


function loadProjectData()
{
  var holder = document.getElementById('year_content');
  for(i = 0; i < projects.length; i++)
  { 
    var list = document.createElement("div");
    list.className = "tab-pane";
    list.id = projects[i].start_year;
    console.log("About to start the loop");
    var listelement = document.createElement("ul");
    listelement.className = "wave";

    for(j = 0; j < projects[i].result.length; j++)
    {
      console.log("Project: " + projects[i].result[j]);
      var ahref = document.createElement("a"); 
      ahref.href = "#";
      ahref.setAttribute("id",projects[i].result[j]);
      ahref.setAttribute("onclick", "javascript:loadup(this.id);");
      var text = document.createTextNode(projects[i].result[j]);
      var listitem = document.createElement("li");
      ahref.appendChild(text);
      listitem.appendChild(ahref);
      listelement.appendChild(listitem);
    }
    list.appendChild(listelement);
    holder.appendChild(list);
  }
  //<div class="tab-pane active" id="visitors">Hello</div>
  //               <div class="tab-pane" id="browser">Yellow</div>
  //               <div class="tab-pane" id="geography">Mello</div>
}

function drawProjects()
{


 
  console.log("Results: " + projects.length);
  var holder = document.getElementById('year_tabs');

  for(i = 0; i < projects.length; i++)
  {
    console.log(projects[i].start_year); 
    var list = document.createElement("li");
    var ahref = document.createElement("a"); 
    ahref.href = "#" + projects[i].start_year;
    ahref.setAttribute("data-toggle","tab");
    var listtext = document.createTextNode(projects[i].start_year);
    console.log("Projects: " + projects[i].result.length); 
    ahref.appendChild(listtext);
    list.appendChild(ahref);
    holder.appendChild(list);
  }
  console.log("done");

}

function drawAllCharts(results)
{
      var cp_data = new google.visualization.DataTable(); 
      var bcm_data = new google.visualization.DataTable();
      var slippage_data = new google.visualization.DataTable();
      var invalid_data = new google.visualization.DataTable();

      //Setup the columns for the graphs
      cp_data.addColumn('number', 'X');
      cp_data.addColumn('number', 'iOS');
      cp_data.addColumn('number', 'Android');
      cp_data.addColumn('number','Avg');

      bcm_data.addColumn('number', 'X');
      bcm_data.addColumn('number', 'iOS');
      bcm_data.addColumn('number', 'Android');
      bcm_data.addColumn('number','Avg');

      slippage_data.addColumn('number', 'X');
      slippage_data.addColumn('number', 'iOS');
      slippage_data.addColumn('number', 'Android');
      slippage_data.addColumn('number','Avg');

      invalid_data.addColumn('number', 'X');
      invalid_data.addColumn('number', 'iOS');
      invalid_data.addColumn('number', 'Android');
      invalid_data.addColumn('number','Avg');

      var count = 0;
      while (count < results.length/2)
      {
        
        buildCP(results, count, cp_data);
        buildBCM(results, count, bcm_data);
        buildSlippage(results, count, slippage_data);
        buildInvalid(results,count,invalid_data);
        count++; 
      }


      //Style the CP Chart
      var options = styleGraphs();
      console.log("Done Building CP"); 
      
      var cp_chart = new google.visualization.LineChart(document.getElementById('bugs_cp_chart'));
      var bcm_chart = new google.visualization.LineChart(document.getElementById('bcm_chart')); 
      var slippage_chart = new google.visualization.LineChart(document.getElementById("bugs_slippage_chart"));
      var invalid_chart = new google.visualization.LineChart(document.getElementById("bugs_invalid_chart"))
 
      cp_chart.draw(cp_data, options); 
      bcm_chart.draw(bcm_data, options);
      slippage_chart.draw(slippage_data, options);
      invalid_chart.draw(invalid_data, options);

      console.log("done drawing the chart");

}

//Style the Complexity Point Graph
function styleGraphs()
{
      var options = {
        width: 1000,
        height: 563,
        hAxis: {
          title: 'By Quarter',
          ticks: [{v:0,f:'2012 - Q1'}, {v:1,f:'2012 - Q2'}, {v:2,f:'2012 - Q3'}, {v:3,f:'2012 - Q4'},{v:4,f:'2013 - Q1'}, {v:5,f:'2013 - Q2'}, {v:6,f:'2013 - Q3'}, {v:7,f:'2013 - Q4'},
                  {v:8,f:'2014 - Q1'}, {v:9,f:'2014 - Q2'}, {v:10,f:'2014 - Q3'}, {v:11,f:'2014 - Q4'}],

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
      return options;
}

//Function for building the complexity points graph
function buildCP(results, count, cp_data)
{
        var platform_offset = 12;

        //iOS 
        bugs_total_iOS = results[count].bugs_total;
        bugs_invalid_iOS = results[count].bugs_invalid; 
        bugs_cp_iOS = results[count].story_data.complexity_points;
        bugs_total_iOS = bugs_total_iOS - bugs_invalid_iOS; 
        ratio_iOS = bugs_total_iOS/bugs_cp_iOS; 
        var android = count + platform_offset;

        //Android 
        bugs_total_android = results[android].bugs_total;
        bugs_invalid_android = results[android].bugs_invalid; 
        bugs_cp_android = results[android].story_data.complexity_points;
        bugs_total_android = bugs_total_android - bugs_invalid_android;
        ratio_android = bugs_total_android/bugs_cp_android;

        ratio_avg = (ratio_android + ratio_iOS)/2 
        cp_data.addRow([count,ratio_iOS,ratio_android, ratio_avg]); 
}

//Function for building the invalid bug ratio
function buildInvalid(results, count, invalid_data)
{
        //console.log("i: " + i)
        //console.log("Data: " + JSON.stringify(results[i]));
        var platform_offset = 12;
        //iOS 
        bugs_total_iOS = results[count].bugs_total;
        bugs_invalid_iOS = results[count].bugs_invalid;
        ratio_iOS = bugs_invalid_iOS/bugs_total_iOS;

        var android = count + platform_offset;
        //Android
        bugs_total_android = results[android].bugs_total;
        bugs_invalid_android = results[android].bugs_invalid;
        ratio_android = bugs_invalid_android/bugs_total_android;

        ratio_avg = (ratio_android + ratio_iOS)/2 
        count++;
        invalid_data.addRow([count,ratio_iOS,ratio_android, ratio_avg]); 
}
//Function for building the blocker, critical, major graphs
function buildBCM(results, count, bcm_data)
{
        //console.log("i: " + i);
        //console.log("Data: " + JSON.stringify(results[i]));
        var platform_offset = 12;
        //iOS
        bugs_major_iOS = results[count].bugs_major;
        bugs_critical_iOS = results[count].bugs_critical;
        bugs_blocker_iOS = results[count].bugs_blocker;
        bugs_total_iOS = results[count].bugs_total;
        bugs_invalid_iOS = results[count].bugs_invalid;
        bugs_bcm_iOS = bugs_blocker_iOS + bugs_critical_iOS + bugs_major_iOS;
        bugs_total_iOS = bugs_total_iOS - bugs_invalid_iOS;
        ratio_iOS = bugs_bcm_iOS/bugs_total_iOS;

        var android = count + platform_offset;
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
        count++;
        bcm_data.addRow([count,ratio_iOS,ratio_android, ratio_avg]); 
}

//Slippage ratio is the ratio of client reported bugs to total bugs
function buildSlippage(results, count, slippage_data)
{
        //console.log("i: " + i);
        //console.log("Data: " + JSON.stringify(results[i]));
        var platform_offset = 12;

        //iOS 
        bugs_total_iOS = results[count].bugs_total;  
        bugs_client_reported = results[count].bugs_client_reported;
        ratio_iOS = bugs_client_reported/bugs_total_iOS;

        var android = count + platform_offset;

        //Android 
        bugs_total_android = results[android].bugs_total; 
        bugs_client_reported = results[android].bugs_client_reported;
        ratio_android = bugs_client_reported/bugs_total_android;

        ratio_avg = (ratio_android + ratio_iOS)/2 
        count++;
        slippage_data.addRow([count,ratio_iOS,ratio_android, ratio_avg]); 

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
 


