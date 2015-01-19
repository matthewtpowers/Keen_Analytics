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
						:product => "APP-14-042_Caster_Android", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 10,
							:normal => 6,
							:minor => 6,
							:design => 1,
							:enhancement => 0,
							:total_bugs =>  23,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 41
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak"],
							:dev => ["Kenny"],
							:product => ["Chaitanya","David"],
							:design => ["Matt"],
						},
						:store_rating =>
						{ 
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-14-042_Caster_iOS", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 3,
							:major => 25,
							:normal => 34,
							:minor => 11,
							:design => 11,
							:enhancement => 0,
							:total_bugs => 109,
							:reopened => 0,
							:invalid => 3,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 90
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak"],
							:dev => ["Amir","Josh"],
							:product => ["Chaitanya","David"],
							:design => ["Matt"],
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