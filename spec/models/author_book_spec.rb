require 'rails_helper'

RSpec.describe AuthorBook do
  context 'relationships' do
    it { should belong_to :author }
    it { should belong_to :book }
  end
end
