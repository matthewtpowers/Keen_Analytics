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
  change_create_id_array = Array.new
  re_estimate_array = Array.new
  re_estimate_values_array = Array.new
  change_create = parsed.select do |activity|
    activity['kind'].eql?('story_create_activity')
  end 
  change_create.each do |activity|
    activity["changes"].each do |change|
      change_create_id_array.push(change["id"])
    end
  end
  change_create.map do |story|
    story["changes"].map do |changes|
      if changes["new_values"]["estimate"].nil?
        changes["new_values"]["estimate"] = "unestimated"
      end
      id = changes["new_values"]["id"]
      type = changes["new_values"]["story_type"]
      estimate = changes["new_values"]["estimate"]
      puts
      puts "ID: " + "#{id}"
      puts "Type: " + "#{type}"
      puts "Estimate on creation: " + "#{estimate}"
      if estimate == "unestimated"
         estimate = 0
      end
      estimate_array.push(estimate)

      uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{id}/activity?occurred_after=#{date1}T01:00:15Z&occurred_before=#{date2}T20:00:15Z")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
      response = http.request(request)
      @data = response.body
      parsed = JSON.parse(@data)

      parsed.reverse_each do |activity|
        if activity.include?('invalid_parameter') || activity.include?('error') || activity.include?('code') || activity.include?('unfound_resource')
          next
        elsif activity.has_key?("highlight")
          if activity["highlight"] == "estimated"
            activity["changes"].each do |change|
              new_estimate = change["new_values"]["estimate"]
              estimate_array[-1] = new_estimate
              puts "Estimate after creation: #{new_estimate}"
            end
          end
        end
      end
    end
  end
  total_scope_creep_from_creation = estimate_array.inject { |sum,x| sum + x }
  total_scope_creep_from_creation = 0 if total_scope_creep_from_creation.nil?
  puts
  puts "Scope creep from story creations: " + "#{total_scope_creep_from_creation}"

  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/activity?occurred_after=#{date1}T01:00:15Z&occurred_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  parsed.each do |activity|
    if activity["highlight"] == "estimated"
      re_estimate_array.push(activity)
    end
  end
  re_estimate_array.each do |activity|
    activity["changes"].each do |change|
      @id = change["id"]
    end
    if change_create_id_array.include?(@id)
      next
    else
      activity["changes"].each do |change|
        re_estimate_values_array.push(change["new_values"]["estimate"] - change["original_values"]["estimate"])  unless change["original_values"]["estimate"].nil?
        if change["original_values"]["estimate"].nil?
          re_estimate_values_array.push(change["new_values"]["estimate"])
        end
      end
    end
  end
  total_new_points = re_estimate_values_array.inject { |sum,x| sum + x }
  total_new_points = 0 if total_new_points.nil?
  puts "Additional points from re-estimates: #{total_new_points}"
  total_scope_creep = total_scope_creep_from_creation + total_new_points
  puts "Total scope creep: #{total_scope_creep}"
end

scope(project_id, date1, date2)