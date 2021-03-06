require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of :country_name }
  end

  describe 'relationships' do
    it { should have_many :olympians }
  end
end
