require 'json'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'openssl'

prompt = '> '
puts "What is the id of the Project you want to get stories from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()
puts "What are the initials of the person you want to get activity from? ex: NP"
print prompt
initials = STDIN.gets.chomp()
initials = initials.upcase

raw_data_request = ARGV.first


def rejection_check(project_id, date1, date2, initials, raw_data_request)
  if date2 == ""
    date_now = Time.now.to_s.split
    date2 = date_now[0]
  else
    date2 = date2
  end
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?updated_after=#{date1}T01:00:15Z&updated_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)

  product_manager_log = Array.new
  @authored_story_array = Array.new
  @authored_story_id_array = Array.new
  array_log = Array.new
  @rejected_story_array = Array.new
  @rejected_story_id_array = Array.new

  parsed.each do |story|
    story_id = story["id"]
    uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story_id}/activity?occurred_after=#{date1}T01:00:15Z&occurred_before=#{date2}T20:00:15Z")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
    response = http.request(request)
    @story_data = response.body
    parsed_activity = JSON.parse(@story_data)
    parsed_activity.map do |activity|
      if activity.include?('invalid_parameter') || activity.include?('error')
        next
      else
        if activity.has_key?('performed_by')
          product_manager_log.push(activity)
        end
      end
    end
    product_manager_log.each do |entry|
      if entry["performed_by"]["initials"] == "#{initials}"
        @authored_story_array.push(entry)
      end
    end
  end

  @authored_story_array.each do |activity|
    activity["changes"].map do |activity_info|
      @authored_story_id_array.push(activity_info)
    end
  end
  @authored_story_id_array.each do |thing|
    if thing.include?('unfound_resource') || thing.include?('error') 
      puts
    else
      if thing.has_key?('new_values')
        if thing["new_values"]["current_state"] == 'rejected'
          @rejected_story_array.push(thing)
        end
      end
    end
  end
  if raw_data_request == '-r'
    puts @rejected_story_array
  elsif raw_data_request.nil?
    @rejected_story_array.each do |story|
      @rejected_story_id_array.push(story["id"])
    end
    @rejected_story_id_array = @rejected_story_id_array.uniq!
    puts @rejected_story_id_array
    puts "Total stories rejected: #{@rejected_story_id_array.length}"
  else
    puts "Unknown command '#{raw_data_request}'. Please use '-r' to get raw data, or no command to get just ids."
  end
end

rejection_check(project_id, date1, date2, initials, raw_data_request)