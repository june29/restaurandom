Bundler.require
require "json"
require "open-uri"

json_path = "./docs/shops.json"
shops = JSON.load(open(json_path))

urls = File.read("./shop-urls.txt").split("\n")

urls.each { |url|
  next if shops.map { |shop| shop["url"] }.include?(url)

  puts "Fetch: #{url}"

  html = Nokogiri::HTML(open(url))

  name = html.css("h2.display-name").text.strip

  shops.push({
    url: url,
    name: name,
  })

  sleep 3
}

File.write(json_path, JSON.pretty_generate(shops))
