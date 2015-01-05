require 'json'
require 'net/http'
require 'nokogiri'

prompt = '> '
puts "What is the id of the Project you want to get data from?"
print prompt
project_id = STDIN.gets.chomp()
puts "What type of bugs do you want to get?"
print prompt
type = STDIN.gets.chomp()


def bug(project_id, type)
  net = Net::HTTP.new("www.pivotaltracker.com")
  request = Net::HTTP::Get.new("/services/v3/projects/#{project_id}/stories?filter=label%3Aqa-#{type}")
  request.add_field("X-TrackerToken", "e366bbaab02d2ab18aca4fd7b2704ec6")
  net.read_timeout = 10
  net.open_timeout = 10

  response = net.start do |http|
    http.request(request)
  end
  # print response.read_body
  xml = Nokogiri::XML.parse(response.body)
  puts "#{type.capitalize} bug count: #{xml.xpath('/stories/@total')}"
end

bug(project_id, type)