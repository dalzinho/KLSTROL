class Deal

  attr_accessor :title, :burger_id, :day

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @burger_id = options['burger_id']
    @day = options['day']
  end

  def save()
    sql = "INSERT INTO deals (title, burger_id, day) VALUES ('#{@title}', #{@burger_id}, '#{@day}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM deals;"
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

  def update()
    sql = "UPDATE deals SET (title, burger_id, day) = ('#{@title}', #{@burger_id}, '#{@day}');"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM deals WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

end