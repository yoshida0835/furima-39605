require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end
  

  # ユーザー新規登録についてのテストコード
  describe 'ユーザー新規登録' do

    context 'ユーザー新規登録できるとき' do

      it '項目が全て入力されている' do
        expect(@user).to be_valid
      end

    #  it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    #    @user.password = '12345a'
    #    @user.password_confirmation = '12345a'
    #    expect(@user).to be_valid
    #  end
    end


    context 'ユーザー新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        # nicknameが空では登録できないテストコードを記述します
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'family_nameが空では登録できない' do
        # family_nameが空では登録できないテストコードを記述します
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank"
      end
      it 'first_nameが空では登録できない' do
        # first_nameが空では登録できないテストコードを記述します
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'family_name_kanaが空では登録できない' do
        # family_name_kanaが空では登録できないテストコードを記述します
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        # first_name_kanaが空では登録できないテストコードを記述します
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        # birthdayが空では登録できないテストコードを記述します
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end

      it 'emailに一意性がないと登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include "Email has already been taken" 
      end

      it 'emailに@が含まれないと登録できない' do
        @user.email = 'testemail'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid" 
      end

      it "passwordが6文字以下であれば登録できない" do
        @user.password = '12345' # 意図的に5文字のパスワードを設定してエラーが出るかをテスト 
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
        # このテキストは6文字以上で指定してください（現在は5文字です）
      end

      it "passwordは英数字混合であれば登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
        # このテキストは6文字以上で指定してください（現在は5文字です）
      end

      it 'passwordとpassword_confimationの値が一致していないと登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '12345b'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'family_nameが全角入力でなければ登録できない' do
        @user.family_name = 'ｱｲｳｴｵ' # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end

      it 'first_nameが全角入力でなければ登録できない' do
        @user.first_name = 'ｱｲｳｴｵ' 
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'family_name_kanaが全角カタカナでなければ登録できない' do
        @user.family_name_kana = 'あいうえお' # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end

      it 'first_name_kanaが全角カタカナでなければ登録できない' do
        @user.first_name_kana = 'あいうえお' # 意図的にひらがな入力を行いエラーを発生させる
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
    end
  end
end
