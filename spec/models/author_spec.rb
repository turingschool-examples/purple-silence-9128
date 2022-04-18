require 'rails_helper'

RSpec.describe Author do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :birth_year }
  end
end
