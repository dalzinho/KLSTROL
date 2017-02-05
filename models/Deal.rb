class Deal

  attr_reader :id
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

  def get_burger
    sql = "SELECT b.name FROM burgers b INNER JOIN deals d ON d.burger_id = b.id WHERE d.id = #{@id};"
    return SqlRunner.run(sql).first['name']
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = #{id};"
    result = SqlRunner.run(sql).first
    return Deal.new(result)
  end

  # def get_vendor
  #   sql = "SELECT v.name FROM vendors v INNER JOIN deals d ON d.vendor_id = v.id WHERE d.id = #{@id};"
  #   return SqlRunner.run(sql).first['name']
  # end

end