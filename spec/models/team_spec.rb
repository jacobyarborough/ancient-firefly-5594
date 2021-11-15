require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:players) }
    it { should have_many(:competition_teams) }
    it { should have_many(:competitions).through(:competition_teams) }
  end

  describe 'class methods' do 
    before(:each) do 
      @team1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
      @team2 = Team.create!(hometown: 'Denver', nickname: 'Hornets')
      @team3 = Team.create!(hometown: 'Colorado Springs', nickname: 'Panthers')
    end 
    
    describe '.get_id' do
      it 'returns a team id for a given nickname' do
        expect(Team.get_id(@team3.nickname)).to eq(@team3.id)
      end 
    end 
  end 
end
