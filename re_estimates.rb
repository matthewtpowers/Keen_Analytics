require 'json'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'active_support'

prompt = '> '
puts "What is the id of the Project you want to get scope creep from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()



def scope(project_id, date1, date2)
  if date2 == ""
    date_now = Time.now.to_s.split
    date2 = date_now[0]
  else
    date2 = date2
  end
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/activity?occurred_after=#{date1}T01:00:15Z&occurred_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  estimate_array = Array.new
  re_estimate_values_array = Array.new
  parsed.each do |activity|
    if activity["highlight"] == "estimated" 
      estimate_array.push(activity)
    end
  end
  estimate_array.each do |activity|
    activity["changes"].each do |change|
      re_estimate_values_array.push(change["new_values"]["estimate"] - change["original_values"]["estimate"])  unless change["original_values"]["estimate"].nil?
      if change["original_values"]["estimate"].nil?
        re_estimate_values_array.push(change["new_values"]["estimate"])
      end
    end
  end
  total_new_points = re_estimate_values_array.inject { |sum,x| sum + x }
  total_new_points = 0 if total_new_points.nil?
  puts "Total points from re-estimates: #{total_new_points}"
end

scope(project_id, date1, date2)