RAILS_ENV = 'development', 'production'
require File.expand_path('../environment', __FILE__)

require 'csv'

file = File.open("president1.csv")   #(r:iso8859-1)

   
   CSV.foreach(file) do |row| 
   
   @temp = row
   
   presidency  = @temp[0]
   president   = @temp[1]
   took_office = @temp[2]
   left_office = @temp[3]
   party       = @temp[4]
   picture     = @temp[5]
   state       = @temp[6]
   term        = @temp[7]
   biography   = @temp[8]

  
   @cics = Cic.new
   @cics.presidency   = presidency
   @cics.president    = president
   @cics.took_office  = took_office
   @cics.left_office  = left_office
   @cics.party        = party
   @cics.image        = picture
   @cics.state        = state
   @cics.term         = term
   @cics.biography    = biography
   @cics.save
end
#f.close #close file