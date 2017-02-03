require 'pg'

class SqlRunner

  def self.run(sql)
    begin
      db = PG.connect({dbname: "klstrol", host: 'localhost'})
      db.exec(sql)
    ensure
      db.close
    end
  end
end