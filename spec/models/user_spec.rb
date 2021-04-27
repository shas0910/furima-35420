require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報を適切に入力すると新規登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが@を含んでいれば登録できる' do
        @user.email = 'a@a'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上、かつ半角英数字が混ざっていれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'last_nameとfirst_nameが全角ひらがな、カタカナ、漢字なら登録できる' do
        @user.last_name = 'あア阿'
        @user.first_name = 'かカ火'
        expect(@user).to be_valid
      end
      it 'last_name_kanaとfirst_name_kanaが全角カタカナなら登録できる' do
        @user.last_name_kana = 'アアア'
        @user.first_name_kana = 'カカカ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが既に登録されているものと同じでは登録できない' do
        @user.save
        user = FactoryBot.build(:user)
        user.email = @user.email
        user.valid?
        expect(user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@を含んでいなければ登録できない' do
        @user.email = 'email.address'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字未満では登録できない' do
        @user.password = 'aa111'
        @user.password_confirmation = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'bbb222'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'passwordが全角英数字混合では登録できない' do
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'last_nameとfirst_nameが空では登録できない' do
        @user.last_name = ''
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
      end
      it 'last_nameとfirst_nameに全角ひらがな、カタカナ、漢字以外が含まれていると登録できない' do
        @user.last_name = 'abcあ'
        @user.first_name = 'vvvな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters', 'First name Full-width characters')
      end
      it 'last_name_kanaとfirst_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "First name kana can't be blank")
      end
      it 'last_name_kanaとfirst_name_kanaに全角カタカナ以外が含まれていると登録できない' do
        @user.last_name_kana = 'あア'
        @user.first_name_kana = '火カカ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters',
                                                      'First name kana Full-width katakana characters')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
