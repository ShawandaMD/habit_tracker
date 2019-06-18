#Users
user1 = User.create(name: "Emily Payton" ,email: "emily@gmail.com" ,password:"emily")
user2 = User.create(name: "Chris Moore" ,email: "chris@gmail.com" ,password: "chris")
user3 = User.create(name: "Erin Hall" ,email: "erin@gmail.com" ,password: "erin")

#habits
h1 = user1.habits.create(name: "Mediate for 5 minutes" ,category: "Health" ,goal: "Want to increase to 10 minutes in 30 days" )
h2 = user1.habits.create(name: "Eat Keto" ,category: "Health" ,goal: "I want to loose 10 pounds" )
h3 = user1.habits.create(name: "Read 10 pages of Psychology book" ,category: "Education" ,goal: "To finish reading psycology book in 2 months" )
h4 = user2.habits.create(name: "Stop Smoking" ,category: "Health" ,goal: "Cut down to 1 cigarette a week in a month" )
