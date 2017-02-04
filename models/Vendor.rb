require './db/SqlRunner'

class Vendor

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i
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

  def self.update(options)
    sql = "UPDATE vendors SET 
          name = '#{options['name']}'
          WHERE id = '#{options['id']}';"
    SqlRunner.run(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM vendors WHERE id = #{id};"
    SqlRunner.run(sql)
  end

  def self.find(search_id)
    sql = "SELECT * FROM vendors WHERE id = #{search_id};"
    vendor = SqlRunner.run(sql).first
    return Vendor.new(vendor)
  end

end
