class Burger

  attr_reader :id
  attr_accessor :name, :price, :vendor_id, :calories

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @price = options['price'].to_f
    @calories = options['calories'].to_i
    @vendor_id = options['vendor_id'].to_i
    @kcal_price_ratio = options['calories'].to_f / options['price'].to_f.round(3)
  end

  def save()
 
    sql = "INSERT INTO burgers (name, price, calories, vendor_id, kcal_price_ratio) VALUES ('#{@name}', #{@price}, #{@calories},#{@vendor_id}, #{@kcal_price_ratio}) RETURNING *;"
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
    SET (name, price, calories, vendor_id) = 
    ('#{options['name']}', #{options['price']}, #{options['calories']}, #{options['vendor_id']}) WHERE id = #{options['id']};"
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

  def self.get_by_vendor(search_id)
    sql = "SELECT * FROM burgers WHERE vendor_id = #{search_id};"
    return SqlRunner.run(sql).map { |burger| Burger.new(burger)}
  end

  def adjust_price(adjustment)
    adjusted_price = @price * adjustment
  end

  def adjust_calorie_count(adjustment)
    adjusted_count = @calories * adjustment
  end

  def get_kpr(price_adjustment, calorie_adjustment)
    return adjust_calorie_count(calorie_adjustment).to_f / adjust_price(price_adjustment)
  end

  def self.mean_kpr
    sql = "SELECT avg(kcal_price_ratio) FROM burgers;"
    return SqlRunner.run(sql).first['avg'].to_f
  end

  def self.stdev_kpr
    sql = "SELECT stddev(kcal_price_ratio) FROM burgers;"
    return SqlRunner.run(sql).first['stddev'].to_f
  end

  def k_score(price_adjustment, calorie_adjustment)
    mean = get_kpr(price_adjustment, calorie_adjustment) - Burger.mean_kpr
    standardised_value = mean / Burger.stdev_kpr
    return (500 + (200 * standardised_value)).to_i
  end

end
