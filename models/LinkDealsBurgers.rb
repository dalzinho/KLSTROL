
class LinkDealsBurgers

  attr_reader :id
  attr_accessor :deal_id, :burger_id

  def initialize(options)
    @id = options['id']
    @deal_id = options['deal_id']
    @burger_id = options['burger_id']
  end

  def save()
    sql = "INSERT INTO link_burgers_and_deals (deal_id, burger_id) VALUES (#{@deal_id}, #{@burger_id}) RETURNING id;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end
  
  def self.find(search_id)
    sql = "SELECT * FROM link_burgers_and_deals WHERE deal_id = #{search_id};"
    return SqlRunner.run(sql).map { |deal| LinkDealsBurgers.new(deal) }
  end

  def self.all()
    sql = "SELECT * FROM link_burgers_and_deals;"
    return SqlRunner.run(sql).map { |deal| LinkDealsBurgers.new(result) }
  end

  def burger_name
    sql = "SELECT b.name FROM burgers b INNER JOIN link_burgers_and_deals l ON b.id = l.burger_id;"
    return SqlRunner.run(sql).first['name']
  end
end