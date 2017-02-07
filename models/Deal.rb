class Deal

  attr_reader :id
  attr_accessor :title, :vendor_id, :day

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @vendor_id = options['vendor_id']
    @day = options['day']
  end

  def save()
    sql = "INSERT INTO deals (title, vendor_id, day) VALUES ('#{@title}', #{@vendor_id}, '#{@day}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM deals;"
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

  def self.update(options)
    sql = "UPDATE deals SET (title, vendor_id, day) = ('#{options['title']}', #{options['vendor_id']}, '#{options['day']}') WHERE id = #{options['id']} ;"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM deals WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def get_burger
    sql = "SELECT b.name FROM burgers b INNER JOIN deals d ON d.vendor_id = b.id WHERE d.id = #{@id};"
    return SqlRunner.run(sql).first['name']
  end

  def get_vendor()
    sql = "SELECT v.name FROM vendors v INNER JOIN deals d ON v.id = d.vendor_id WHERE d.id = #{@id};"
    return SqlRunner.run(sql).first['name']
  end

  def self.find(id)
    sql = "SELECT * FROM deals WHERE id = #{id};"
    result = SqlRunner.run(sql).first
    return Deal.new(result)
  end

  def self.get_today()
    sql = "SELECT * FROM deals WHERE day = '#{Time.new.strftime('%A')}';"
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end
  

  # def get_vendor
  #   sql = "SELECT v.name FROM vendors v INNER JOIN deals d ON d.vendor_id = v.id WHERE d.id = #{@id};"
  #   return SqlRunner.run(sql).first['name']
  # end

end