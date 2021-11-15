require 'rails_helper'

RSpec.describe 'teams index page' do 
  before(:each) do 
    @team1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @team2 = Team.create!(hometown: 'Denver', nickname: 'Hornets')
    @player1 = @team1.players.create!(name: "Liam", age: 18)
    @player2 = @team1.players.create!(name: "Olivia", age: 20)
    @player3 = @team2.players.create!(name: "Emma", age: 25)
    @player4 = @team2.players.create!(name: "Oliver", age: 27)

    visit teams_path
  end 

  it 'shows teams and their attributes' do 
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
  end 

  it 'lists all players for ach team and their attributes' do 
    within("#team-#{@team1.id}") do 
      expect(page).to have_content(@player1.name)
      expect(page).to have_content(@player1.age)
      expect(page).to have_content(@player2.name)
      expect(page).to have_content(@player2.age)
    end 

    within("#team-#{@team2.id}") do 
      expect(page).to have_content(@player3.name)
      expect(page).to have_content(@player3.age)
      expect(page).to have_content(@player4.name)
      expect(page).to have_content(@player4.age)
    end 
  end 

  it 'lists teams from highest average age to lowest' do 
    expect(@team2.nickname).to appear_before(@team1.nickname)
  end 
end 


