require('pg')
class Property

  attr_accessor :num_bedrooms, :year_built, :status, :build
  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @num_bedrooms = options['num_bedrooms']
    @year_built = options['year_built']
    @status = options['status']
    @build = options['build']
  end

  def save()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "INSERT INTO property (num_bedrooms, year_built, status, build) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@num_bedrooms, @year_built, @status, @build]
    db.prepare("save", sql)
    properties = db.exec_prepared("save", values)
    @id = properties[0]['id']
    db.close()
  end

  def Property.delete_all()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "DELETE FROM property;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def delete()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "DELETE FROM property WHERE id = $1;"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()
  end

  def Property.all()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "SELECT * FROM property;"
    property_hashes = db.exec(sql)
    properties = property_hashes.map { |property_hash| Property.new(property_hash) }
    db.close()
    return properties
  end

  def update()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "UPDATE property SET (num_bedrooms, year_built, status, build) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@num_bedrooms, @year_built, @status, @build, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Property.find(id)
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "SELECT * FROM property WHERE id = $1;"
    values = [id]
    db.prepare("find", sql)
    find_property = db.exec_prepared("find", values)
    return find_property[0]
    db.close()

  end

end
