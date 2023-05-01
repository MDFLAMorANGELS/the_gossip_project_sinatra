class Gossip
    attr_accessor :author, :content, :time

    def initialize(author, content, time)
        @content = content
        @author = author
        @time = time
    end

    def save
        CSV.open("db/gossip.csv", "ab") do |csv|
          csv << [author, content, time]
        end
    end

    def self.all
        all_gossips = [] # On crée un array vide qui va contenir tous les potins
        CSV.foreach("db/gossip.csv") do |row| # On lit chaque ligne du fichier CSV
          gossip = Gossip.new(row[0], row[1], row[2]) # On crée un objet Gossip avec les données lues
          all_gossips << gossip # On ajoute le nouveau gossip à notre array
        end
        if all_gossips.empty?
          return []
        else
          return all_gossips.reverse! # On retourne l'array contenant tous les potins
        end
    end

end