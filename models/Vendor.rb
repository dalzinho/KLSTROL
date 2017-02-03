require './db/SqlRunner'

class Vendor

  attr_accessor :name

  def initialize(options)
    @id = options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO vendors (name) VALUES ('#{@name}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def self.all()
    sql = "SELECT * FROM vendors;"
    result = SqlRunner.run(sql)
    return result.map { |vendor| Vendor.new(vendor)}
  end

  def update()
    sql = "UPDATE vendors SET name = '#{name}' WHERE id = #{@id};"
    SqlRunner.run(sql)

  end

  def delete()
    sql = "DELETE FROM vendors WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

end
