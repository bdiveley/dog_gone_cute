#seed breed list with starter list from https://dog.ceo/dog-api/documentation/

File.open('./data/breeds.txt').each do |breed|
  Breed.create(name: breed.strip)
  puts "#{breed} is added"
end
