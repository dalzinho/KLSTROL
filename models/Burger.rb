def Burger

  def initialize
    @id = options['id']
    @name = options['name']
    @price = options['price'].to_f
    @vendor_id = options['vendor_id'].to_i
  end

  def create()
    sql = "INSERT INTO burgers (name, price, vendor_id) VALUES ('#{@name}', #{@price}, #{vendor_id}) RETURNING *;"
    result = SqlRunner.run(sql).first
    @id = result['id']
  end

  def read()

  end

  def update()

  end

  def delete()

  end

end
