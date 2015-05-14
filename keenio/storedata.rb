require 'json'
require 'keen'

#Only need a collection name if we are not doing batch processing
collection_name = "product_snapshot"
ruby_file = "ruby_string"

## Note this is going to have to be chagned to figure out what the values were since the last time you put everything into the system.  We can only accept the deltas. 
## Keen IO is limited in the sense I can't do the operations as a total sum on the latest records, I need to keep track of the deltas unfortunately.  It actually makes sense 
## if you want to time lapse this
begin
event_props =  {:product_snapshot_final =>
	[
					{ 
						:product => "APP-15-004_Branch_Metrics", 
						:platform => "Xamarin",
						:start_year => 2015,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 6,
							:minor => 1,
							:design => 0,
							:enhancement => 1,
							:total_bugs => 5,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 82
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak", "Dan"],
							:dev => ["Rob"],
							:product => ["Sarah"],
							:design => ["NA"],
						},
						:store_rating =>
						{ 
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-15-007_Turtle_Beach_Retainer", 
						:platform => "Android",
						:start_year => 2015,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 16,
							:minor => 6,
							:design => 14,
							:enhancement => 0,
							:total_bugs => 36,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 70
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak", "Dan"],
							:dev => ["Beth"],
							:product => ["Nick", "Sarah"],
							:design => ["Matt K"],
						},
						:store_rating =>
						{ 
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-15-012_Surf_Air", 
						:platform => "iOS",
						:start_year => 2015,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 2,
							:normal => 6,
							:minor => 5,
							:design => 1,
							:enhancement => 0,
							:total_bugs => 14,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 63
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak", "Dan"],
							:dev => ["Rehmat"],
							:product => ["David"],
							:design => ["Matt K"],
						},
						:store_rating =>
						{ 
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-15-015_DisneyTomorrowLandWatch", 
						:platform => "iOS",
						:start_year => 2015,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 4,
							:normal => 10,
							:minor => 7,
							:design => 16,
							:enhancement => 0,
							:total_bugs => 37,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 50
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak", "Dan"],
							:dev => ["Arun"],
							:product => ["Nick"],
							:design => ["David"],
						},
						:store_rating =>
						{ 
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					}
			]
		}
end

#event_props = File.read(ruby_file)
 
begin
 
#result = Keen.publish(collection_name,event_props)

result = Keen.publish_batch(event_props)

puts "successful."
puts result
rescue => e
puts e
puts "failed!"
end