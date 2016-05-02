
require 'Ariel'
require 'open-uri'
khlstructure = Ariel::Node::Structure.new do |r| # defines structure content to be scraped from article pages at http://khabarlahariya.org
    r.list :article_content do |a|
        a.item :headline
        a.item :body
        a.item :url
        a.list :byline_fields do |b|
            b.item :language
            b.item :date
            b.item :other
        end
        a.item :tag
    end
   end

File.open('structure.yaml', 'wb') do |file|
  YAML.dump khlstructure, file # This is to enable use of the Ariel CLI
end

Ariel.learn(khlstructure, *Dir['./labeled_training_files'])
