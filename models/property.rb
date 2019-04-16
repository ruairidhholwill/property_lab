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

  def Property.delete_all()
    db = PG.connect({dbname: 'property', host: 'localhost'});
    sql = "DELETE FROM property;"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end




end
