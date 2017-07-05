require "pry"
class Pokemon

	attr_accessor :id, :name, :type, :db

	def initialize(name:, type:, db: nil, id:)
		@name = name
		@type = type
		# @db = db
		@id = id

	end

	def self.save(name, type, db_conn)
		db_conn.execute("INSERT INTO pokemon (name, type)
			VALUES (?, ?)", name, type)

	end

	def self.new_from_db(row)
		pokemon = self.new(id: row[0], name: row[1], type: row[2])
		# pokemon.id = row[0]
		# pokemon.name = row[1]
		# pokemon.type = row[2]
		#pokemon.db = 
		#binding.pry
		pokemon
	end




	def self.find(id, db)
		sql = <<-SQL
			SELECT * FROM pokemon
			WHERE ? = pokemon.id
		SQL
		#binding.pry
		db.execute(sql, id).map do |row|
			self.new_from_db(row)
		end.first
	end
end
