require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open('./db/gossip.csv', 'a') do |csv|
      csv << [author, content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("./db/gossip.csv") do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    all_gossips
  end

  def self.find(id)
    all_gossips = CSV.read("./db/gossip.csv")
    if id >= 0 && id < all_gossips.length
      Gossip.new(all_gossips[id][0], all_gossips[id][1])
    else
      nil
    end
  end
end
def self.update(id, updated_author, updated_content)
  gossips = all

  if gossips[id]
    gossips[id].author = updated_author
    gossips[id].content = updated_content

    CSV.open('./db/gossip.csv', 'w') do |csv|
      gossips.each do |gossip|
        csv << [gossip.author, gossip.content]
      end
    end
  end
end
