require 'rails_helper'

RSpec.describe 'competition show page' do 
  before(:each) do 
    @team1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @team2 = Team.create!(hometown: 'Denver', nickname: 'Hornets')
    @team3 = Team.create!(hometown: 'Colorado Springs', nickname: 'Panthers')
    @player1 = @team1.players.create!(name: "Liam", age: 18)
    @player2 = @team1.players.create!(name: "Olivia", age: 20)
    @player3 = @team1.players.create!(name: "Noah", age: 22)
    @player4 = @team2.players.create!(name: "Emma", age: 25)
    @player5 = @team2.players.create!(name: "Oliver", age: 27)
    @player6 = @team2.players.create!(name: "Ava", age: 24)
    @comp1 = Competition.create!(name: "Champions Tournament", location: "Grand Junction", sport: "basketball")
    @comp1.teams << @team1
    @comp1.teams << @team2

    visit competition_path(@comp1)
  end 

  it "shows the competition's attributes" do 
    expect(page).to have_content(@comp1.name)
    expect(page).to have_content(@comp1.location)
    expect(page).to have_content(@comp1.sport)
  end 

  it 'shows all competing teams and their attribues' do 
    expect(page).to have_content(@team1.nickname)
    expect(page).to have_content(@team1.hometown)
    expect(page).to have_content(@team2.nickname)
    expect(page).to have_content(@team2.hometown)
  end 

  it 'shows the average age of competing players' do
    expect(page).to have_content("Avg Player Age: 22.67")
  end 

  it 'has a test field to enter a team name to add to the competition' do 
    fill_in "nickname", with: "#{@team3.nickname}"
    click_on "Add Team"

    expect(current_path).to eq(competition_path(@comp1))
    expect(page).to have_content(@team3.nickname)
    expect(page).to have_content(@team3.hometown)
  end 
end 