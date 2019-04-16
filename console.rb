require_relative('models/property.rb')
#:num_bedrooms, :year_built, :status, :build

Propeort.delete_all()

options1 = {'num_bedrooms' => 3, 'year_built' => 1863, 'status' => 'buy', 'build' => 'semi-detached'}
options2 = {'num_bedrooms' => 7, 'year_built' => 1700, 'status' => 'buy', 'build' => 'detached'}

property1 = Property.new(options1)
property2 = Property.new(options2)
