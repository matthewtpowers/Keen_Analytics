require 'json'
require 'keen'

#Only need a collection name if we are not doing batch processing
#collection_name = "product_snapshot"
ruby_file = "ruby_string"

begin
event_props =  {:product_snapshot_final =>
	[
				   { 
					:product => "APP-12-008_Infotradix", 
					:platform => "Android",
					:start_year => 2012,
					:quarter => 1,
					:bug_type => 
					{
						:blocker => 7,
						:critical => 11,
						:major => 24,
						:normal => 9,
						:minor => 52,
						:design => 0,
						:enhancement => 0,
						:total_bugs => 105,
						:reopened => 0,
						:invalid => 2,
						:client_reported => 24
					},
					:story_data => 
					{
						:requirements => 0,
						:reopened_stories => 0,
						:complexity_points => 0
					},
					:qa_data =>
					{
						:total_test_cases => 0,
						:test_cases_passed => 0,
						:test_cases_failed => 0,
					},
					:team_data =>
					{
						:qa => ["shilpan"],
						:dev => ["kenny","matt"],
						:product => ["arie"],
						:design => ["christine","abeer"],
					},
					:store_rating =>
					{ 
						:dates_released=>[""],
						:total_reviews=> 32,
						:stars => 4.7
					} 
				  },
				  { 
					:product => "APP-12-008_Infotradix", 
					:platform => "iOS",
					:start_year => 2012,
					:quarter => 1,
					:bug_type => 
					{
						:blocker => 3,
						:critical => 8,
						:major => 7,
						:normal => 6,
						:minor => 0,
						:design => 0,
						:enhancement => 0,
						:total_bugs => 25,
						:reopened => 0,
						:invalid => 1,
						:client_reported => 0
					},
					:story_data => 
					{
						:requirements => 0,
						:reopened_stories => 0,
						:complexity_points => 0
					},
					:qa_data =>
					{
						:total_test_cases => 0,
						:test_cases_passed => 0,
						:test_cases_failed => 0,
					},
					:team_data =>
					{
						:qa => ["shilpan"],
						:dev => ["Amir"],
						:product => ["arie"],
						:design => ["christine","abeer"],
					},
					:store_rating =>
					{ 
						:dates_released=>[""],
						:total_reviews=> 30,
						:stars => 4.5
					}
					},
					{ 
						:product => "APP-12-008_Infotradix_WebPortal", 
						:platform => "Web",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 5,
							:major => 25,
							:normal => 30,
							:minor => 33,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>111,
							:reopened => 0,
							:invalid => 16,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Ujjval"],
							:product => ["arie"],
							:design => ["christine","abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""], 
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-11-020_BankRate", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 1,
							:normal => 1,
							:minor => 7,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>15,
							:reopened => 0,
							:invalid => 6,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Amir"],
							:product => ["Sid"],
							:design => ["christine","abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-11-024_NOAA", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 14,
							:normal => 14,
							:minor => 11,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>51,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 12
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Matt","Thomas","Sagar","Chaitanya", "Arun"],
							:product => ["Matt"],
							:design => ["christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 9,
							:stars => 4
						}
					},
					{ 
						:product => "APP-11-058_Round_Robin", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 4,
							:critical => 3,
							:major => 9,
							:normal => 7,
							:minor => 65,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>89,
							:reopened => 0,
							:invalid => 19,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Sagar","Dave S","Rob"],
							:product => ["Matt"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-002_eMarketer", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 10,
							:normal => 0,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>10,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Amir"],
							:product => ["Matt"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-002_eMarketer", 
						:platform => "Blackberry",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 2,
							:normal => 0,
							:minor => 1,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>3,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["shilpan"],
							:dev => ["Arun"],
							:product => ["Matt"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-011_Atmospheir", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 13,
							:major => 26,
							:normal => 32,
							:minor => 41,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>114,
							:reopened => 0,
							:invalid => 16,
							:client_reported => 42
						},
						:story_data => 
						{
							:requirements => 199,
							:reopened_stories => 0,
							:complexity_points => 130
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Ric","Nihkil"],
							:product => ["Ari"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-013_Hybrid_Fitness", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 5,
							:normal => 2,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>7,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 6
						},
						:story_data => 
						{
							:requirements => 199,
							:reopened_stories => 0,
							:complexity_points => 130
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Nick D"],
							:product => ["Sid"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-014_Cigarette_a_Day", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 2,
							:major => 12,
							:normal => 15,
							:minor => 23,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>63,
							:reopened => 0,
							:invalid => 9,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 170,
							:reopened_stories => 0,
							:complexity_points => 32
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Nick D"],
							:product => ["Sid"],
							:design => ["Amadeus"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-015_LevelUp", 
						:platform => "Windows Phone",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 3,
							:major => 17,
							:normal => 38,
							:minor => 34,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>94,
							:reopened => 0,
							:invalid => 22,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 199,
							:reopened_stories => 0,
							:complexity_points => 67
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Arun"],
							:product => ["Mayank"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-018_Stkr.It_PhaseIII", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 28,
							:normal => 62,
							:minor => 36,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>126,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 27
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Nick"],
							:product => ["Mayank"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-018_Stkr.It_PhaseIII", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 9,
							:major => 18,
							:normal => 73,
							:minor => 38,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>139,
							:reopened => 0,
							:invalid => 25,
							:client_reported => 27
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Nick"],
							:product => ["Mayank"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-031_MuMM", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 4,
							:critical => 6,
							:major => 21,
							:normal => 25,
							:minor => 48,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>104,
							:reopened => 0,
							:invalid => 2,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 462,
							:reopened_stories => 0,
							:complexity_points => 179
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Amir"],
							:product => ["Patrick Davis"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-032_Foster_1b", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 5,
							:major => 26,
							:normal => 16,
							:minor => 42,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>89,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 9
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Amir", "Nick D"],
							:product => ["Patrick Davis", "Matt Powers"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-032_Foster_1b", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 3,
							:critical => 10,
							:major => 24,
							:normal => 17,
							:minor => 22,
							:design => 0,
							:enhancement => 0,
							:total_bugs =>76,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 9
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Amir", "Nick D"],
							:product => ["Patrick Davis", "Matt Powers"],
							:design => ["Christine"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-033_KnowledgeFactor", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 12,
							:major => 40,
							:normal => 35,
							:minor => 24,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>112,
							:reopened => 0,
							:invalid => 30,
							:client_reported => 30
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Dave S", "Josh W"],
							:product => ["Tom Yoon"],
							:design => ["Mallory"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-033_KnowledgeFactor", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 9,
							:critical => 11,
							:major => 49,
							:normal => 63,
							:minor => 27,
							:design => 0,
							:enhancement => 5,
							:total_bugs =>159,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 30
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Tom K"],
							:product => ["Tom Yoon"],
							:design => ["Mallory"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-035_Spentit", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 14,
							:critical => 33,
							:major => 163,
							:normal => 70,
							:minor => 79,
							:design => 3,
							:enhancement => 5,
							:total_bugs =>433,
							:reopened => 0,
							:invalid => 28,
							:client_reported => 140
						},
						:story_data => 
						{
							:requirements => 529,
							:reopened_stories => 0,
							:complexity_points => 288
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Amir","Jamus"],
							:product => ["Patrick D"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 49,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-12-037_Wireless_Generation", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 3,
							:major => 25,
							:normal => 42,
							:minor => 91,
							:design => 0,
							:enhancement => 4,
							:total_bugs =>178,
							:reopened => 0,
							:invalid => 11,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Tom K","Kenny"],
							:product => ["Patrick D"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-039_Mayo", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 4,
							:critical => 3,
							:major => 23,
							:normal => 25,
							:minor => 0,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>56,
							:reopened => 0,
							:invalid => 21,
							:client_reported => 3
						},
						:story_data => 
						{
							:requirements => 120,
							:reopened_stories => 0,
							:complexity_points => 34
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Dave S"],
							:product => ["Michael K"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "App-12-041_Weightloss_With_Friends", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 3,
							:critical => 9,
							:major => 16,
							:normal => 47,
							:minor => 36,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>116,
							:reopened => 0,
							:invalid => 2,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["NA"],
							:dev => ["NA"],
							:product => ["NA"],
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
						:product => "APP-12-043_Xylem_Ipad", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 14,
							:major => 30,
							:normal => 48,
							:minor => 114,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>256,
							:reopened => 0,
							:invalid => 44,
							:client_reported => 17
						},
						:story_data => 
						{
							:requirements => 261,
							:reopened_stories => 0,
							:complexity_points => 117
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Jan"],
							:product => ["Michael"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 8,
							:stars => 4
						}
					},
					{ 
						:product => "APP-12-043_Xylem", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 14,
							:major => 30,
							:normal => 48,
							:minor => 114,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>148,
							:reopened => 0,
							:invalid => 25,
							:client_reported => 20
						},
						:story_data => 
						{
							:requirements => 261,
							:reopened_stories => 0,
							:complexity_points => 117
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Jan"],
							:product => ["Michael"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 8,
							:stars => 4
						}
					},
					{ 
						:product => "APP-12-044_ASICS", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 24,
							:major => 65,
							:normal => 26,
							:minor => 23,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>160,
							:reopened => 0,
							:invalid => 16,
							:client_reported => 33
						},
						:story_data => 
						{
							:requirements => 69,
							:reopened_stories => 0,
							:complexity_points => 175
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kenny"],
							:product => ["Mayank"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 2268,
							:stars => 3.5
						}
					},
					{ 
						:product => "APP-12-053_CLSA", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 4,
							:critical => 6,
							:major => 5,
							:normal => 19,
							:minor => 15,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>69,
							:reopened => 0,
							:invalid => 2,
							:client_reported => 84
						},
						:story_data => 
						{
							:requirements => 201,
							:reopened_stories => 0,
							:complexity_points => 413
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Rob"],
							:product => ["Nick"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-027_Wilton", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 7,
							:critical => 3,
							:major => 32,
							:normal => 26,
							:minor => 32,
							:design => 0,
							:enhancement => 1,
							:total_bugs =>124,
							:reopened => 0,
							:invalid => 23,
							:client_reported => 32
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kailash","Chaitanya"],
							:product => ["Patrick Davis"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-058_CheckedUp", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 2,
							:normal => 17,
							:minor => 15,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>27,
							:reopened => 0,
							:invalid => 3,
							:client_reported => 14
						},
						:story_data => 
						{
							:requirements => 1,
							:reopened_stories => 0,
							:complexity_points => 10
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Jan"],
							:product => ["Michael"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
						:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-052_MyBloc", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 19,
							:major => 61,
							:normal => 55,
							:minor => 22,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>168,
							:reopened => 0,
							:invalid => 9,
							:client_reported => 25
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Jan"],
							:product => ["Patrick D"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 100,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-12-059_Conexis", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 11,
							:major => 13,
							:normal => 11,
							:minor => 46,
							:design => 0,
							:enhancement => 3,
							:total_bugs =>98,
							:reopened => 0,
							:invalid => 12,
							:client_reported => 25
						},
						:story_data => 
						{
							:requirements => 91,
							:reopened_stories => 0,
							:complexity_points => 196
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kenny"],
							:product => ["Nick","Sarah"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-12-066_ParkMe", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 3,
							:critical => 5,
							:major => 25,
							:normal => 34,
							:minor => 30,
							:design => 54,
							:enhancement => 1,
							:total_bugs =>159,
							:reopened => 0,
							:invalid => 5,
							:client_reported => 37
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Arun"],
							:product => ["Nick","Sarah"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 630,
							:stars => 4
						}
					},
					{ 
						:product => "App-12-068_Maglite", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 2,
							:major => 5,
							:normal => 1,
							:minor => 1,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 9,
							:reopened => 0,
							:invalid => 2,
							:client_reported => 2
						},
						:story_data => 
						{
							:requirements => 17,
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
							:qa => ["Shilpan"],
							:dev => ["Jamus"],
							:product => ["Mayank"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "App-12-076_GoogleZeitgeist", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 1,
							:major => 8,
							:normal => 15,
							:minor => 22,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 55,
							:reopened => 0,
							:invalid => 7,
							:client_reported => 7
						},
						:story_data => 
						{
							:requirements => 90,
							:reopened_stories => 0,
							:complexity_points => 353
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kenny"],
							:product => ["Matt L"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 359,
							:stars => 3.9
						}
					},
					{ 
						:product => "App-12-076_GoogleZeitgeist", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 0,
							:major => 5,
							:normal => 10,
							:minor => 16,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 32,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 90,
							:reopened_stories => 0,
							:complexity_points => 353
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Carlin"],
							:product => ["Matt L"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "App-12-073_ShadowMev2_External", 
						:platform => "iOS",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 5,
							:major => 8,
							:normal => 32,
							:minor => 17,
							:design => 0,
							:enhancement => 17,
							:total_bugs => 82,
							:reopened => 0,
							:invalid => 2,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Jamus"],
							:product => ["Nick"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 90,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-12-077_Xylem_Android", 
						:platform => "Android",
						:start_year => 2012,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 6,
							:major => 17,
							:normal => 47,
							:minor => 24,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 104,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 100
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kailash"],
							:product => ["Michael"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 90,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-12-078_ASICSv2", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 7,
							:major => 23,
							:normal => 23,
							:minor => 10,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 69,
							:reopened => 0,
							:invalid => 5,
							:client_reported => 1
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kailash"],
							:product => ["Michael"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 90,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-13-004_Imagine_If", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 13,
							:major => 18,
							:normal => 122,
							:minor => 123,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 350,
							:reopened => 0,
							:invalid => 19,
							:client_reported => 32
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 209
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Dave S", "Rob P"],
							:product => ["Sarah","Patrick D"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 67,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-13-009_Sunday_Ticket", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 28,
							:major => 16,
							:normal => 74,
							:minor => 16,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 136,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 62
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 415
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Shilpan"],
							:dev => ["Kenny","Kailash"],
							:product => ["Sarah"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 408,
							:stars => 2.4
						}
					},
					{ 
						:product => "App-13-007_Turtle_Beach", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 34,
							:normal => 41,
							:minor => 8,
							:design => 0,
							:enhancement => 4,
							:total_bugs => 93,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 8
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 150
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Thomas"],
							:product => ["Sarah"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "App-13-011_ASICSv3", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 29,
							:major => 52,
							:normal => 103,
							:minor => 45,
							:design => 0,
							:enhancement =>2,
							:total_bugs => 283,
							:reopened => 0,
							:invalid => 44,
							:client_reported => 8
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 293
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Chaitanya"],
							:product => ["Nick"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 2268,
							:stars => 3.5
						}
					},
					{ 
						:product => "APP-13-015_Rexnord", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 2,
							:major => 18,
							:normal => 44,
							:minor => 4,
							:design => 0,
							:enhancement =>2,
							:total_bugs => 73,
							:reopened => 0,
							:invalid => 3,
							:client_reported => 6
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 162
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kenny"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 7,
							:stars => 3.7
						}
					},
					{ 
						:product => "APP-13-015_Rexnord", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 5,
							:major => 13,
							:normal => 20,
							:minor => 16,
							:design => 0,
							:enhancement =>1,
							:total_bugs => 56,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 9
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 118
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Amir"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 7,
							:stars => 3.7
						}
					},
					{ 
						:product => "APP-13-016_ShadowMe_v3", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 4,
							:normal => 19,
							:minor => 0,
							:design => 0,
							:enhancement =>1,
							:total_bugs => 23,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 21
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 45
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Amir"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 90,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-13-008_Next_Tier_Education", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 77,
							:major => 56,
							:normal => 110,
							:minor => 104,
							:design => 0,
							:enhancement =>2,
							:total_bugs => 368,
							:reopened => 0,
							:invalid => 16,
							:client_reported => 40
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 377
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Amir"],
							:product => ["Sarah"],
							:design => ["Abeer"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-017_Ryder", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 0,
							:major => 1,
							:normal => 2,
							:minor => 0,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 4,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 10
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Arun"],
							:product => ["NA"],
							:design => ["NA"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 127,
							:stars => 2.8
						}
					},
					{ 
						:product => "APP-13-019_Mt.Gox", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 30,
							:major => 22,
							:normal => 138,
							:minor => 36,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 240,
							:reopened => 0,
							:invalid => 7,
							:client_reported => 18
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 288
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Thomas"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 879,
							:stars => 2.0
						}
					},
					{ 
						:product => "APP-13-019_Mt.Gox", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 3,
							:normal => 39,
							:minor => 7,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 57,
							:reopened => 0,
							:invalid => 7,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 165
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Carlin"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-023_Wilton_Enhancements", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 33,
							:major => 12,
							:normal => 2,
							:minor => 0,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 47,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 3
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 37
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kailash", "Rob"],
							:product => ["David L"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 817,
							:stars => 4.2
						}
					},
					{ 
						:product => "APP-13-025_Disney", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 11,
							:minor => 0,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 11,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 37
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["NA"],
							:product => ["Nick"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-032_TouchMuzik", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 3,
							:major => 5,
							:normal => 125,
							:minor => 4,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 154,
							:reopened => 0,
							:invalid => 17,
							:client_reported => 19
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 134
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kenny", "Contractor"],
							:product => ["Nick"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-036_Turtle_Beach_Translations", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 2,
							:major => 3,
							:normal => 11,
							:minor => 2,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 18,
							:reopened => 0,
							:invalid => 17,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 100
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Beth"],
							:product => ["Sarah"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-038_Sterling", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 4,
							:minor => 3,
							:design => 0,
							:enhancement =>1,
							:total_bugs => 17,
							:reopened => 0,
							:invalid =>3,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 150
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Carlin"],
							:product => ["Sarah"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-038_Sterling", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 2,
							:major => 1,
							:normal => 4,
							:minor => 3,
							:design => 0,
							:enhancement =>2,
							:total_bugs => 13,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 150
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Carlin"],
							:product => ["Sarah"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-041_TurtleBeach_Target", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 1,
							:normal => 0,
							:minor => 1,
							:design => 0,
							:enhancement =>0,
							:total_bugs => 2,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 40
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Beth"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-042_CLSA_v1.5", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 6,
							:major => 16,
							:normal => 29,
							:minor => 31,
							:design => 0,
							:enhancement =>1,
							:total_bugs => 86,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 2
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Rob"],
							:product => ["David"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-043_Xylem_v2", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 3,
							:normal => 3,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 6,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 17
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kenny"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 15,
							:stars => 4.3
						}
					},
					{ 
						:product => "APP-13-043_Xylem_v2", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 3,
							:normal => 5,
							:minor => 3,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 12,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 17
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Amir"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 8,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-13-049_ShadowMe_Updates", 
						:platform => "iOS",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 2,
							:major => 5,
							:normal => 8,
							:minor => 17,
							:design => 0,
							:enhancement => 4,
							:total_bugs => 41,
							:reopened => 0,
							:invalid =>4,
							:client_reported => 11
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 62
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Amir"],
							:product => ["Nick"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 90,
							:stars => 4.5
						}
					},
					{ 
						:product => "APP-13-050_Turtle Beach_Updates", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 2,
							:major => 5,
							:normal => 18,
							:minor => 10,
							:design => 0,
							:enhancement => 6,
							:total_bugs => 41,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 30
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Beth"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-055_Google_Santa_Tracker", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 1,
							:major => 8,
							:normal => 11,
							:minor => 7,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 27,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 5
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 100
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kenny"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 19654,
							:stars => 4.2
						}
					},
					{ 
						:product => "APP-13-053_HP_Caseable", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 324,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 371,
							:reopened => 0,
							:invalid =>47,
							:client_reported => 60
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 230
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kenny","Beth"],
							:product => ["Chaitanya"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-13-054_Asicsv4", 
						:platform => "Android",
						:start_year => 2013,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 20,
							:normal => 42,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 62,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 100
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Guarav"],
							:dev => ["Kailash"],
							:product => ["Nick"],
							:design => ["David A"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "App-13-058_Agamatrix", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 0,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 0,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["NA"],
							:dev => ["Rob"],
							:product => ["NA"],
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
						:product => "APP-14-001_Viggle_MyGuy", 
						:platform => "Web",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 0,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 0,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 0
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["NA"],
							:dev => ["Thomas","Arun","Carlin"],
							:product => ["NA"],
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
						:product => "APP-14-002_Rexnord_Updates", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 0,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 0,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 10
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Ronak","Gaurav"],
							:dev => ["Amir"],
							:product => ["NA"],
							:design => ["NA"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 7,
							:stars => 3.7
						}
					},
					{ 
						:product => "APP-14-006_Viggle_IVA", 
						:platform => "Web",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 0,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 0,
							:reopened => 0,
							:invalid =>0,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 10
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["NA","NA"],
							:dev => ["Thomas","Arun","Carlin"],
							:product => ["NA"],
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
						:product => "APP-14-010_Curbstand_iOS", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 39,
							:normal => 36,
							:minor => 36,
							:design => 5,
							:enhancement => 0,
							:total_bugs => 116,
							:reopened => 0,
							:invalid =>12,
							:client_reported => 10
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 141
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Arun","Amir"],
							:product => ["Sarah"],
							:design => ["Rob S"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 14,
							:stars => 4
						}
					},
					{ 
						:product => "APP-14-010_Curbstand_Android", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 1,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 0,
							:major => 22,
							:normal => 43,
							:minor => 24,
							:design => 31,
							:enhancement => 9,
							:total_bugs => 121,
							:reopened => 0,
							:invalid =>12,
							:client_reported => 40
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 93
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Kailash"],
							:product => ["Sarah"],
							:design => ["Rob S"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-14-011_CLSA_1.75_Marlin", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 1,
							:critical => 0,
							:major => 113,
							:normal => 3,
							:minor => 3,
							:design => 22,
							:enhancement => 0,
							:total_bugs => 142,
							:reopened => 0,
							:invalid =>20,
							:client_reported => 40
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 148
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Kailash"],
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
						:product => "APP-14-014_TurtleBeach_Content_Updates", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 2,
							:critical => 0,
							:major => 24,
							:normal => 21,
							:minor => 7,
							:design => 28,
							:enhancement => 11,
							:total_bugs => 82,
							:reopened => 0,
							:invalid => 5,
							:client_reported => 12
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 289
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Beth"],
							:product => ["Sarah"],
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
						:product => "APP-14-022_CLSA_1.51", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 13,
							:normal => 41,
							:minor => 10,
							:design => 0,
							:enhancement => 23,
							:total_bugs => 64,
							:reopened => 0,
							:invalid => 17,
							:client_reported => 10
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 123
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Tom"],
							:product => ["Chaitanya"],
							:design => ["David"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-14-039_TurtleBeach_BBY_Rewrite", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 2,
						:bug_type => 
						{
							:blocker => 5,
							:critical => 5,
							:major => 38,
							:normal => 11,
							:minor => 5,
							:design => 16,
							:enhancement => 10,
							:total_bugs => 80,
							:reopened => 0,
							:invalid => 5,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 49
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Beth"],
							:product => ["Chaitanya"],
							:design => ["David"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 0,
							:stars => 0
						}
					},
					{ 
						:product => "APP-14-032_ShadowMe_iOS_6.0", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 10,
							:normal => 14,
							:minor => 16,
							:design => 8,
							:enhancement => 6,
							:total_bugs => 48,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 14
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 49
						},
						:qa_data =>
						{
							:total_test_cases => 0,
							:test_cases_passed => 0,
							:test_cases_failed => 0,
						},
						:team_data =>
						{
							:qa => ["Guarav","Ronak"],
							:dev => ["Beth"],
							:product => ["Chaitanya"],
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
						:product => "APP-14-035_LaCoco", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 3,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 0,
							:normal => 1,
							:minor => 0,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 1,
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
							:qa => ["Guarav","Ronak"],
							:dev => ["Amir","Arun"],
							:product => ["Nick"],
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
						:product => "App-14-036_GoogleSantaTracker", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 29,
							:normal => 46,
							:minor => 24,
							:design => 0,
							:enhancement => 0,
							:total_bugs => 99,
							:reopened => 0,
							:invalid => 0,
							:client_reported => 17
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 79
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
							:dev => ["Rob","Tom"],
							:product => ["Chaitanya"],
							:design => ["David"],
						},
						:store_rating =>
						{
							:dates_released=>[""],
							:total_reviews=> 31021,
							:stars => 4.2
						}
					},
					{ 
						:product => "APP-14-042_Caster_Android", 
						:platform => "Android",
						:start_year => 2014,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 4,
							:normal => 12,
							:minor => 4,
							:design => 11,
							:enhancement => 0,
							:total_bugs => 31,
							:reopened => 0,
							:invalid => 1,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => -147
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
							:critical => 0,
							:major => 1,
							:normal => 13,
							:minor => 6,
							:design => 5,
							:enhancement => 0,
							:total_bugs => 25,
							:reopened => 0,
							:invalid => 10,
							:client_reported => 0
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 198
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
					},
					{ 
						:product => "APP-14-047_Ovatemp_iOS_Updates", 
						:platform => "iOS",
						:start_year => 2014,
						:quarter => 4,
						:bug_type => 
						{
							:blocker => 0,
							:critical => 0,
							:major => 12,
							:normal => 10,
							:minor => 5,
							:design => 22,
							:enhancement => 0,
							:total_bugs => 49,
							:reopened => 0,
							:invalid => 4,
							:client_reported => 7
						},
						:story_data => 
						{
							:requirements => 0,
							:reopened_stories => 0,
							:complexity_points => 173
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
							:dev => ["Josh"],
							:product => ["David"],
							:design => ["Matt"],
						},
						:store_rating =>
						{ 
							:dates_released=>["1411776000"],
							:total_reviews=> 17,
							:stars => 4.5
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