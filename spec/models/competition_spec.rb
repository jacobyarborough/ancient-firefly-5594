require 'rails_helper'

RSpec.describe Competition, type: :model do 
  describe 'relationships' do 
    it { should have_many(:competition_teams) }
    it { should have_many(:teams).through(:competition_teams) }
  end 

  describe 'instance methods' do
    before(:each) do 
      @team1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
      @team2 = Team.create!(hometown: 'Denver', nickname: 'Hornets')
      @player1 = @team1.players.create!(name: "Liam", age: 18)
      @player2 = @team1.players.create!(name: "Olivia", age: 20)
      @player3 = @team1.players.create!(name: "Noah", age: 22)
      @player4 = @team2.players.create!(name: "Emma", age: 25)
      @player5 = @team2.players.create!(name: "Oliver", age: 27)
      @player6 = @team2.players.create!(name: "Ava", age: 24)
      @comp1 = Competition.create!(name: "Champions Tournament", location: "Grand Junction", sport: "basketball")
      @comp1.teams << @team1
      @comp1.teams << @team2
    end 
    describe '#avg_player_age' do 
      it 'returns the average age of all players in a competition' do 
        expect(@comp1.avg_player_age).to eq(22.67)
      end 
    end 
  end 
end 