require 'rails_helper'


RSpec.describe BookAuthor, type: :model do
    

    describe 'relationships' do
        
        it { belong_to :author }
        it { belong_to :book }
    end


end