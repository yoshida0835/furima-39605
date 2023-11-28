require 'rails_helper'

RSpec.describe Relationship, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @relationship = FactoryBot.build(:relationship)
  end

  describe 'フォローする' do
    context "フォローできる場合" do
      it "follower_idとfollowing_idがあればフォローできる" do
        expect(@relationship).to be_valid
      end
    end

    context "フォローできない場合" do
      it "follower_idがnilの場合は保存できない" do
        @relationship.follower_id = nil
        @relationship.valid?
      #  expect(@relationship.errors[:follower_id]).to include("を入力してください")
      end

      it "following_idがnilの場合はフォローできない" do
        @relationship.following_id = nil
        @relationship.valid?
      #  expect(@relationship.errors[:following_id]).to include("を入力してください")
      end
    end
  end
end

