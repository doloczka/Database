# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
wy=Wykladowca.create(imie: "Wy1Im", nazwisko: "Wy1Naz", login: "wy", haslo: "wy", email: "wy1@example.com")
st=Student.create(login: "st", haslo: "st", email: "st@exam.com", imie: "St1Im", nazwisko: "StNAz", nralbumu: "111" )
