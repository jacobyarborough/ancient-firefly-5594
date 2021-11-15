team1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
team2 = Team.create!(hometown: 'Denver', nickname: 'Hornets')
team3 = Team.create!(hometown: 'Colorado Springs', nickname: 'Panthers')

player1 = team1.players.create!(name: "Liam", age: 18)
player2 = team1.players.create!(name: "Olivia", age: 20)
player3 = team1.players.create!(name: "Noah", age: 22)
player4 = team2.players.create!(name: "Emma", age: 25)
player5 = team2.players.create!(name: "Oliver", age: 27)
player6 = team2.players.create!(name: "Ava", age: 24)
player7 = team3.players.create!(name: "Elijah", age: 31)
player8 = team3.players.create!(name: "Charlotte", age: 29)
player9 = team3.players.create!(name: "William", age: 32)

comp1 = Competition.create!(name: "Champions Tournament", location: "Grand Junction", sport: "basketball")
comp2 = Competition.create!(name: "Memorial Day Open", location: "Fort Collins", sport: "Soccer")

comp1.teams << team1
comp1.teams << team2
comp1.teams << team3

comp2.teams << team2
comp2.teams << team3

