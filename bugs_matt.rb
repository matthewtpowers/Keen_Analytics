require 'json'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'openssl' 

prompt = '> '
puts "What is the id of the Project you want to get bugs from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()



def scope(project_id, date1, date2)

  bug_types = ["qa_blocker","qa_critical","qa_major","qa_normal","qa_minor","qa_design", "client_bugs"]
  if date2 == ""
    date_now = Time.now.to_s.split
    date2 = date_now[0]
  else
    date2 = date2
  end 
     
     
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?limit=500&created_after=#{date1}T01:00:15Z&created_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "ebc0d184347fc0586a4dd33d2e801910")
  response = http.request(request) 
  @data = response.body 
  parsed = JSON.parse(@data) 
  puts parsed.count
  bugs = parsed.select do |activity|
    activity['story_type'].eql?('bug')
  end 
 
  @minor_array = Array.new
  @normal_array = Array.new
  @major_array = Array.new
  @critical_array = Array.new
  @blocker_array = Array.new
  @invalid_array = Array.new
  @design_array = Array.new
  @other_array = Array.new
  @qa_client_array = Array.new

  bugs.map do |fields|
    fields["labels"].each do |labels| 
      if labels["name"] == "*qa-minor"
        @minor_array.push(1)
      elsif labels["name"] == "*qa-normal"
      	@normal_array.push(1)
      elsif labels["name"] == "*qa-major"
      	@major_array.push(1)
      elsif labels["name"] == "*qa-critical"
      	@critical_array.push(1)	
      elsif labels["name"] == "*qa-blocker"
      	@blocker_array.push(1)
      elsif labels["name"] == "*invalid"
      	@invalid_array.push(1)	
      elsif labels["name"] == "*design-qa"		
        @design_array.push(1)
      elsif labels["name"] == "*qa-client"		
        @qa_client_array.push(1)
      else
	@other_array.push(1)
      end
    end
  end

  puts "Minor bug count: #{@minor_array.length}"
  puts "Normal bug count: #{@normal_array.length}"
  puts "Major bug count: #{@major_array.length}"
  puts "Critical bug count: #{@critical_array.length}"
  puts "Blocker bug count: #{@blocker_array.length}"
  puts "Invalid bug count: #{@invalid_array.length}"
  puts "Design QA bug count: #{@design_array.length}"
  puts "Other QA bug count: #{@other_array.length}"
  puts "Client QA bug count: #{@qa_client_array.length}"   

  bug_types.each do|d|
    puts d
    uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?with_label=" + d + "&limit=500&created_after=#{date1}T01:00:15Z&created_before=#{date2}T20:00:15Z")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)
    request.add_field("X-TrackerToken", "ebc0d184347fc0586a4dd33d2e801910")
    response = http.request(request) 
    @data = response.body 
    parsed = JSON.parse(@data) 
    puts parsed.count
    id = #{project_id}
    puts id 
  end

end
scope(project_id, date1, date2)