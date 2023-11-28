require 'rails_helper'

RSpec.describe Relationship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @relationship = Relationship.new(follower_id: @user1.id, following_id: @user2.id)

  end

  describe 'フォローする' do
    context "フォローできる場合" do
      it "follower_idとfollowing_idがあればフォローできる" do
        expect(@relationship).to be_valid
      end
    end

    context "フォローできない場合" do
      it "follower_idがなければフォローできない" do
        @relationship.follower_id = nil
        @relationship.valid?
      end

      it "following_idがなければフォローできない" do
        @relationship.following_id = nil
        @relationship.valid?
      end
    end
  end
end