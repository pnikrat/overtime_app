require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Creation' do
    before do
      @user = User.create(email: 'test@test.com', password: 'foobar',
                          password_confirmation: 'foobar', first_name: 'Jon',
                          last_name: 'Snow')
      @post = @user.posts.create(date: Time.zone.today, rationale: 'Anything')
    end

    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without a date and rationale' do
      @post.date = nil
      @post.rationale = nil
      expect(@post).to_not be_valid
    end
  end
end
