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
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?accepted_after=#{date1}T01:00:15Z&accepted_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  # puts @data
  # puts parsed

  bugs = parsed.select do |activity|
    activity['story_type'].eql?('bug')
  end 

  bugs.map do |fields|
    fields["labels"].map do |labels|
      puts labels["name"]
    end
  end
end

scope(project_id, date1, date2)