class Burger

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

  def update()
    sql = "UPDATE burgers SET (name, price, vendor_id) = ('#{@name}', #{@price}, #{@vendor_id});"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM burgers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end
