User.destroy_all
Activity.destroy_all
Habit.destroy_all
Event.destroy_all

#Users
user1 = User.create(name: "Emily Payton" ,email: "emily@gmail.com" ,password:"emily")
user2 = User.create(name: "Chris Moore" ,email: "chris@gmail.com" ,password: "chris")
user3 = User.create(name: "Erin Hall" ,email: "erin@gmail.com" ,password: "erin")

#habits
h1 = user1.habits.create(name: "Mediate for 5 minutes" ,category: "Health" ,goal: "Want to increase to 10 minutes in 30 days" )
h2 = user1.habits.create(name: "Eat Keto" ,category: "Health" ,goal: "I want to loose 10 pounds" )
h3 = user1.habits.create(name: "Read 10 pages of Psychology book" ,category: "Education" ,goal: "To finish reading psycology book in 2 months" )
h4 = user2.habits.create(name: "Stop Smoking" ,category: "Health" ,goal: "Cut down to 1 cigarette a week in a month" )

#events
e1 = Event.create(occurance: "2019-06-24", comment: "I was able to focus today and do a full 10 minutes of meditation")
e2 = Event.create(occurance: "2019-06-23", comment: "Focusing was incredibly hard today")
e3 = Event.create(occurance: "2019-06-18", comment: "Too much noise outside but managed to get at least 5 minutes in")
e4 = Event.create(occurance: "2019-06-17")
e5 = Event.create(occurance: "2019-06-16")
e6 = Event.create(occurance: "2019-06-07")

#Activities

a1 = h1.activities.create(action: "Completed", event_id: 1)
a2 = h1.activities.create(action: "50% completed", event_id: 2)
a3 = h1.activities.create(action: "50% completed", event_id: 3)
a4 = h2.activities.create(action: "Completed", event_id: 4)
a5 = h2.activities.create(action: "Completed", event_id: 5)
a6 = h3.activities.create(action: "No attempt", event_id: 6)
