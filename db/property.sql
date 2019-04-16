DROP TABLE IF EXISTS property;

CREATE TABLE property (
  id SERIAL4 PRIMARY KEY,
  num_bedrooms INT2,
  year_built INT,
  status VARCHAR(255),
  build VARCHAR(255)
)
