require 'json'
require 'net/http'
require 'nokogiri'
require 'open-uri'
require 'openssl'

prompt = '> '
puts "What is the id of the Project you want to get bugs from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What is the id of the Story you want to get activity info from?"
print prompt
story_id = STDIN.gets.chomp()
puts "What is the beginning date you want to return from? ex: 2014-07-02"
print prompt
date1 = STDIN.gets.chomp()
puts "What is the end date you want to return from? ex: 2014-07-16"
print prompt
date2 = STDIN.gets.chomp()



def scope(project_id, story_id, date1, date2)
  uri = URI.parse("https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story_id}/activity")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  response = http.request(request)
  @data = response.body
  parsed = JSON.parse(@data)

  

  parsed.map do |fields|
    fields["changes"].map do |subfields|
      puts subfields["new_values"]["current_state"]
    end
  end

  # parsed.map do |fields|
  #     puts ["current_state"]["name"]
  # end

end

scope(project_id, story_id, date1, date2)