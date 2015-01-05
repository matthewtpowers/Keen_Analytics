require 'json'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'active_support'
require 'active_support/core_ext'

prompt = '> '
puts "What is the id of the Project you want to get state lag from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()



def state_lag(project_id, date1, date2)
  if date2 == ""
    date_now = Time.now.to_s.split
    date2 = date_now[0]
  end
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  story_log = Array.new
  parsed.each do |story|
    story_log.push(story["id"])
  end

  story_log.each do |story|
    uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story}/activity?occurred_after=#{date1}T01:00:15Z&occurred_before=#{date2}T20:00:15Z")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
    response = http.request(request)
    @data = response.body
    parsed = JSON.parse(@data)
    
    parsed.each do |activity|
      if activity.include?('invalid_parameter') || activity.include?('error')
        next
      else
        if activity["kind"] == "story_update_activity"
          if activity["highlight"] == "finished" || activity["highlight"] == "delivered" || activity["highlight"] == "rejected" || activity["highlight"] == "accepted"
            activity["changes"].each do |change|
              unless change["original_values"].nil? || change["new_values"].nil?
                if change["story_type"] == "feature" || change["story_type"] == "bug"
                  state1 = change["original_values"]["current_state"]
                  state2 = change["new_values"]["current_state"]
                  activity_date1 = change["original_values"]["updated_at"]
                  activity_date2 = change["new_values"]["updated_at"]
                  unless activity_date1.nil? || activity_date2.nil?
                    activity_date1 = activity_date1.to_date
                    activity_date2 = activity_date2.to_date
                    date_difference = (activity_date2 - activity_date1).to_i
                    if date_difference > 0
                      story_type = change["story_type"]
                      story_id = change["id"]
                      puts
                      puts "ID: #{story_id}"                    
                      puts "Type: #{story_type}"
                      puts "Lag: #{date_difference} day lag from #{state1} to #{state2}"
                      puts
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

state_lag(project_id, date1, date2)