class Burger

  attr_reader :id
  attr_accessor :name, :price, :vendor_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @price = options['price'].to_f
    @vendor_id = options['vendor_id'].to_i
  end

  def save()
    sql = "INSERT INTO burgers (name, price, vendor_id) VALUES ('#{@name}', #{@price}, #{@vendor_id}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id']
  end

  def self.all()
    sql = "SELECT * FROM burgers;"
    result = SqlRunner.run(sql)
    return result.map { |burger| Burger.new(burger)}
  end

  def self.update(options)
    sql = "UPDATE burgers
    SET (name, price, vendor_id) = 
    ('#{options['name']}', #{options['price']}, #{options['vendor_id']}) WHERE id = #{options['id']};"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM burgers WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM burgers WHERE id = #{id};"
    result = SqlRunner.run(sql).first
    return Burger.new(result)
  end

  def get_vendor_name()
    sql = "SELECT v.name FROM vendors v INNER JOIN burgers b ON b.vendor_id = v.id WHERE b.id = #{@id};"
    return SqlRunner.run(sql).first['name']
  end

end
