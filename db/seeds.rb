# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Wykladowca.create!(imie: 'Wy1Im', 
                   nazwisko: 'Wy1Naz', 
                   login: 'wy', 
                   haslo: 'wy', 
                   email: 'wy1@example.com')
Student.create!(login: "st", 
                haslo: "st", 
                email: "st@exam.com", 
                imie: "St1Im", 
                nazwisko: "StNAz", 
                nralbumu: "111", 
                grupy_id: "1"
                )
                
Grupy.create!(wykladowca_id: "1",
                nazwa: "sroda 9:40")
                
Progre.create!( student_id: "1", 
                pkt_rankingowe: "30", 
                zdrowie: "100", 
                doswiadczenie: "50", 
                level: "1")
Rozwiazanium.create!(wykladowca_id: "1",
                    student_id: "1",
                    przeczytana: "0")
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "1",
                    nr_zadania: "1",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie pierwsze dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "1",
                    nr_zadania: "2",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie drugie dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "1",
                    nr_zadania: "3",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie trzecie dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "1",
                    nr_zadania: "4",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie czwarte dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "1",
                    nr_zadania: "5",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
                    
     #zadania na kolejne dni+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "2",
                    nr_zadania: "1",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "2",
                    nr_zadania: "2",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
					
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "2",
                    nr_zadania: "3",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "2",
                    nr_zadania: "4",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "2",
                    nr_zadania: "5",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )

					
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "3",
                    nr_zadania: "1",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "3",
                    nr_zadania: "2",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "3",
                    nr_zadania: "3",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "3",
                    nr_zadania: "4",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "3",
                    nr_zadania: "5",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )

ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "4",
                    nr_zadania: "1",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "4",
                    nr_zadania: "2",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "4",
                    nr_zadania: "3",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "4",
                    nr_zadania: "4",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "4",
                    nr_zadania: "5",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )

ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "5",
                    nr_zadania: "1",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "5",
                    nr_zadania: "2",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "5",
                    nr_zadania: "3",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "5",
                    nr_zadania: "4",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
ZadaniaGlowne.create!(wykladowca_id: "1",
                    poziom_zadania: "5",
                    nr_zadania: "5",
                    pkt_za_zadanie: "10",
                    tresc: "zadanie piate dzien pierwszy"
                    )
Wiadomosci.create!(wykladowca_id: "1",
		student_id: "1",
		tresc: " pierwsza wiadomosc przykladowa",
		temat: "temacik",
		przeczytana: "0"
		)
Terminy.create!(grupy_id: "1", nr_zajec: "1", poczatek: "2016-01-19 06:00:00" , koniec: "2016-01-19 12:00:00" )
Terminy.create!(grupy_id: "1", nr_zajec: "2", poczatek: "2016-01-20 06:00:00" , koniec: "2016-01-20 12:00:00" )
Terminy.create!(grupy_id: "1", nr_zajec: "3", poczatek: "2016-01-21 06:00:00" , koniec: "2016-01-21 12:00:00" )
Terminy.create!(grupy_id: "1", nr_zajec: "4", poczatek: "2016-01-22 06:00:00" , koniec: "2016-01-22 12:00:00" )
Terminy.create!(grupy_id: "1", nr_zajec: "5", poczatek: "2016-01-23 06:00:00" , koniec: "2016-01-23 12:00:00" )