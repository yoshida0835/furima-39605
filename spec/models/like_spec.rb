require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね！する' do
    context 'いいね！できる場合' do
      it 'ユーザーとアイテムが紐づいている' do
        expect(@like).to be_valid
      end
    end

    context 'いいね！できない場合' do
      it 'ユーザーが紐付いていなければいいね！できない' do
        @like.user = nil
        @like.valid?
      end
      it 'アイテムが紐付いていなければいいね！できない' do
        @like.item = nil
        @like.valid?
      end
    end
  end
end
