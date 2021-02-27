require 'pry'
class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    # def self.save(name, type, db)
    #     sql = <<-SQL
    #     INSERT INTO pokemon (name, type)
    #     VALUES (?, ?)
    #     SQL
    #     @db.execute(sql, name, type)
    # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pok = db.execute("SELECT * FROM pokemon WHERE id = ?;", id ).flatten
    Pokemon.new(id: found_pok[0], name: found_pok[1], type: found_pok[2], db: db)
  end

end
