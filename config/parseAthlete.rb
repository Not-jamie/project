#require 'json'
RAILS_ENV = 'development'
require File.expand_path('../environment', __FILE__)

f = File.open("athletes_data.txt")
f = File.read("athletes_data.txt")
# scan leaves out punctuation such as ' and .
# split divides by space and may work better doesn't
obj = JSON.parse(f)
length = obj.keys.length
i = 0
while i < length
	
  @athlete = Athlete.new
  @athlete.sname = obj[obj.keys[i]]['Second name']
  @athlete.fname = obj[obj.keys[i]]['First name']    
  @athlete.height = obj[obj.keys[i]]['Height (cm)']
  @athlete.weight = obj[obj.keys[i]]['Weight(kg)']
  @athlete.country = obj[obj.keys[i]]['Country/Team']
  @athlete.code = obj[obj.keys[i]]['Country code']
  @athlete.gender = obj[obj.keys[i]]['Gender']
  @athlete.sport = obj[obj.keys[i]]['Sport/Discipline']
  @athlete.save #formerly @word.create
  #obj[obj.keys[i]]['gold']
  i += 1
end

#http://openrefine.org/ might be useful if nae luck