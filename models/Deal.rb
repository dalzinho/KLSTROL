class Deal

  attr_reader :id
  attr_accessor :title, :vendor_id, :day, :description, :burgers_included, :price_adjustment

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @vendor_id = options['vendor_id']
    @day = options['day']
    @description = options['description']
    @burgers_included = options['burgers_included'].to_i
    @price_adjustment = options['price_adjustment'].to_f

  end

  def save()
    sql = "INSERT INTO deals (title, vendor_id, day, description, burgers_included, price_adjustment) VALUES ('#{@title}', #{@vendor_id}, '#{@day}', '#{@description}', #{@burgers_included}, #{@price_adjustment}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM deals;"
    result = SqlRunner.run(sql)
    return result.map { |deal| Deal.new(deal) }
  end

  def self.update(options)
    sql = "UPDATE deals SET (title, vendor_id, day, description) = ('#{options['title']}', #{options['vendor_id']}, '#{options['day']}', '#{options['description']}') WHERE id = #{options['id']} ;"
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

  def self.find(search_id)
    sql = "SELECT * FROM deals WHERE id = #{search_id};"
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