require 'pg'

class SqlRunner

  def run(sql)
    begin
      db = PG.connect({dbname: "klstrol", host: 'localhost'})
      db.exec(sql)
    ensure
      db.close
  end
end