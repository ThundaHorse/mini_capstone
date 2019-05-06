require 'http' 

response = HTTP.get('http://localhost:3000/api/products/')
request = response.parse

stuffs = request["product"]

stuffs.each do |hash| 
  p hash['description']

end 

