class Vendor

  def intialize(options)

    @id = options['id']
    @name = options['name']

  end

  def create()
    sql = "INSERT INTO vendors (name) VALUES ('#{@name}) RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result.first['id']
  end

  def read()

  end

  def update()

  end

  def delete()

  end

end
