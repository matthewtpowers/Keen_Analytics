require 'json'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'openssl'

prompt = '> '
puts "What is the id of the Project you want to get the slippage ratio from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()



def slippage(project_id, date1, date2)
  if date2 == ""
    date_now = Time.now.to_s.split
    date2 = date_now[0]
  else
    date2 = date2
  end
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories?created_after=#{date1}T01:00:15Z&created_before=#{date2}T20:00:15Z")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)
  user_submitted_array = Array.new
  total_bugs_array = Array.new

  parsed.each do |story|
    story["labels"].each do |label|
      if label["name"] == "*user-submitted"
        user_submitted_array.push(story)
      end
    end
  end

  parsed.each do |story| 
    if story['story_type'].eql?('bug')
      total_bugs_array.push(story)
    end
  end

  total_user_submitted = user_submitted_array.length
  total_qa_submitted = total_bugs_array.length - total_user_submitted
  slippage_ratio = total_user_submitted / total_qa_submitted
  # user_submitted_ids = user_submitted_array[0]["id"]

  puts "User-submitted bugs: " + "#{total_user_submitted}"
  puts "QA-submitted bugs: " + "#{total_qa_submitted}"
  puts "Slippage ratio: " + "#{slippage_ratio}"
end

slippage(project_id, date1, date2)