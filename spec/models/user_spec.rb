require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname、email、password、password_confirmation、last_name_kanji、
      first_name_kanji、last_name_kata、first_name_kata、dobが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nicknameが空では登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録出来ない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録出来ない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは英数字複合でないと登録出来ない' do
        @user.password = 'testpassword'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Complexity requirement not met")
      end


      it 'passwordが5文字以下では登録出来ない' do
        @user.password = '1test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end

      it '重複したemailが存在する場合は登録出来ない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailは@を含まないと登録出来ない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'last_name_kanjiは全角（漢字・ひらがな・カタカナ）以外では登録出来ない' do
        @user.last_name_kanji = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji is invalid")
      end

      it 'first_name_kanjiは全角（漢字・ひらがな・カタカナ）以外では登録出来ない' do
        @user.first_name_kanji = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji is invalid")
      end 


      it 'last_name_kataは全角（カタカナ）以外では登録出来ない' do
        @user.last_name_kata = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kata is invalid")
      end

      it 'first_name_kataは全角（カタカナ）以外では登録出来ない' do
        @user.first_name_kata = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kata is invalid")
      end

      it 'dobが空では登録出来ない' do
        @user.dob = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Dob can't be blank")
      end




    end
  end
end
