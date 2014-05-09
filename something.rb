person1 ={ :first => 'Person1First', :last => 'Person1Last' }
person2 ={ :first => 'Person2First', :last => 'Person2Last' }
person3 ={ :first => 'Person3First', :last => 'Person3Last' }
params = { :father => person1, mother: person2, child: person3 }
puts params[:father][:first]
puts params[:mother][:last]

string = 'string strang strung'
puts string.split(', ')
mas = string.split.to_a
puts mas.join(', ')


puts ('a'..'e').to_a.shuffle[2..6].join(', ')
('a'..'e').each do |char|
 puts char.upcase
end