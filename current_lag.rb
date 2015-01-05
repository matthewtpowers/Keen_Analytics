require 'json'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'active_support'
require 'active_support/core_ext'

prompt = '> '
puts "What is the id of the Project you want to get current lag from?"
print prompt
project_id = STDIN.gets.chomp()

def state_lag(project_id)
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  parsed.each do |story|
    if story["current_state"] == "started" || story["current_state"] == "finished" || story["current_state"] == "delivered" || story["current_state"] == "rejected"
      current_state = story["current_state"]
      story_id = story["id"]

      uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story_id}/activity")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
      response = http.request(request)
      @data = response.body
      parsed = JSON.parse(@data)
      activity_array = Array.new
      activity_date_array = Array.new

      parsed.each do |activity|
        if activity["kind"] == "story_update_activity"
          activity_array.push(activity)
        end
      end

      activity_array.each do |activity|
        activity["changes"].each do |change|
          activity_date_array.push(change["new_values"]["updated_at"])
        end
      end

      story_date1 = activity_date_array.max.to_date 
      date_now = Time.now.to_s.split
      story_date2 = date_now[0].to_date
      date_difference = (story_date2 - story_date1).to_i

      if date_difference > 1
        story_id = story["id"]
        story_type = story["story_type"]
        puts
        puts "ID: #{story_id}"
        puts "Type: #{story_type}"
        puts "Current Lag: #{date_difference} day ongoing lag from a #{current_state} state" 
        puts
      end
    end
  end
end

state_lag(project_id)