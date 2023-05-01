class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
        @content = content
        @author = author 
    end

    def save
        CSV.open("db/gossip.csv", "ab") do |csv|
          csv << [author, content]
        end
    end

    def self.all
        all_gossips = [] # On crée un array vide qui va contenir tous les potins
        CSV.foreach("db/gossip.csv") do |row| # On lit chaque ligne du fichier CSV
          gossip = Gossip.new(row[0], row[1]) # On crée un objet Gossip avec les données lues
          all_gossips << gossip # On ajoute le nouveau gossip à notre array
        end
        return all_gossips.reverse! # On retourne l'array contenant tous les potins
    end

  end