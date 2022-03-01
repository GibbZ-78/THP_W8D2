# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts "*** CLEANING STAGE ***"
# Emptying all 3 tables
Attendance.destroy_all
puts "  > Attendances destroyed"
Event.destroy_all
puts "  > Events destroyed"
User.destroy_all
puts "  > Users destroyed"

puts "*** CREATION STAGE ***"
puts "  > Creating & filling users"
# Creating and filling 3 users
User.create(first_name: "Jean-Baptiste",
            last_name: "VIDAL",
            email: "gibbz01@yopmail.com",
            password: "THP_2022",
            age: "43",
            description: "El padre",
            is_admin: true)
puts "    - User nr.1 created"

User.create(first_name: "Valérie-Anne",
            last_name: "DELAIDDE",
            email: "gibbz02@yopmail.com",
            password: "THP_2022",
            age: "44",
            description: "La madre")
puts "    - User nr.2 created"

User.create(first_name: "Lucie",
            last_name: "VIDAL-DELAIDDE",
            email: "gibbz03@yopmail.com",
            password: "THP_2022",
            age: "7",
            description: "La hija")
puts "    - User nr.3 created"

User.create(first_name: "Panzer",
            last_name: "BMW",
            email: "gibbz04@yopmail.com",
            password: "THP_2022",
            age: "5",
            description: "El coche de nuestra familia")
puts "    - User nr.4 created"
puts "  > #{User.count} users created"

puts "  > Creating & filling events"
# Creating and filling 4 events (2 by User "Jean-Baptiste", 1 by "Valérie-Anne", and 1 by "Lucie")
Event.create(title: "Evénement #1",
             location: "Orléans",
             duration: 480,
             description: "Evénement de test organisé par Jean-Baptiste",
             price: 99,
             start_date: "2022-03-27",
             promoter_id: User.first.id)   # Jean-Baptiste 
puts "    - Event nr. #{Event.last.id} OK (#{Event.last.nil?})"

Event.create(title: "Evénement #2",
             location: "Saint-Denis-en-Val",
             duration: 2400,
             description: "Evénement de test (aussi) organisé par Jean-Baptiste",
             price: 666,
             start_date: "2022-12-25",
             promoter_id: User.first.id)   # Jean-Baptiste 
puts "    - Event nr. #{Event.last.id} OK (#{Event.last.nil?})"

Event.create(title: "Evénement #3",
             location: "Paris",
             duration: 240,
             description: "Evénement de test organisé par Valérie-Anne",
             price: 249,
             start_date: "2022-07-06",
             promoter_id: User.second.id)   # Valérie-Anne
puts "    - Event nr. #{Event.last.id} OK (#{Event.last.nil?})"

Event.create(title: "Evénement #4",
             location: "La chambre de Lucie",
             duration: 60,
             description: "Evénement de test organisé par Lucie",
             price: 9,
             start_date: "2022-07-03",
             promoter_id: User.last.id)   # Lucie
puts "    - Event nr. #{Event.last.id} OK (#{Event.last.nil?})"
puts "  > #{Event.count} events created"

puts "  > Creating & filling attendances"
# Creating and filling links between events and users attending
Attendance.create(event_id: Event.first.id,
                  attendee_id: User.second.id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_1")
puts "    - Attendance 1 OK"

Attendance.create(event_id: Event.first.id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_2")
puts "    - Attendance 2 OK"

Attendance.create(event_id: Event.second.id,
                  attendee_id: User.second.id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_3")
puts "    - Attendance 3 OK"

Attendance.create(event_id: Event.all[2].id,
                  attendee_id: User.first.id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_4")
puts "    - Attendance 4 OK"

Attendance.create(event_id: Event.all[2].id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_5")
puts "    - Attendance 5 OK"

Attendance.create(event_id: Event.all[2].id,
                  attendee_id: User.last.id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_5")
puts "    - Attendance 6 OK"

Attendance.create(event_id: Event.all[3].id,
                  attendee_id: User.first.id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_6")
puts "    - Attendance 7 OK"

Attendance.create(event_id: Event.all[3].id,
                  attendee_id: User.all[2].id,
                  stripe_customer_id: "s0m3_R4nd0M_tExt_7")
puts "    - Attendance 8 OK"
puts "  > #{Attendance.count} links between users and events created"

puts "*** END OF SEED (believe it or not...) ***"
# End of SEED