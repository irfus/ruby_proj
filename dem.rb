
## Document vector transforms on a Hindi+Awadhi+Bundeli corpus with the Rsemantic gem

# gem install json
require 'json'

file = IO.readlines('articlestream.json')
data = []
for line in file
  data << JSON.parse(line)
end
data.delete_at(0)


data[1] # we can see the structure of our data

data[1]["results"][0]["article_text"].to_s.gsub /\[?\"\]?/, ""

documents = [] # a new empty container for our documents
# iterate through the data[] containerand concatenate the 'title' and 'article_text' and 'tags' (English) into a single string
data.each do |item|
  string = item["results"][0]["article_text"].to_s.gsub(/\[?\"\]?/, "") + item["results"][0]["title"].to_s + item["results"][0]["tags"].to_s.gsub("Tags:", '')
  documents += [string]
end

documents[0]

require './rsemantic/lib/rsemantic.rb'

puts "Starting"

search = RSemantic::Search.new(documents, {:locale => 'hi', :transforms => [:TFIDF], :verbose => true})



