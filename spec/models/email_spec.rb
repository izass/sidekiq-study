require 'rails_helper'

RSpec.describe Email, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:to) }
  end
end
