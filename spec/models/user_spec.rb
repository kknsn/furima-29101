require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context '新規登録できるとき' do
    it "全ての項目を入力すれば登録できる" do
      expect(@user).to be_valid
    end
  end
  context '新規登録できないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "emailに@がない場合は登録できない" do
      @user.email = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "passwordが5文字以下は登録できない" do
      @user.password = "aaaa1"
      @user.password_confirmation = "aaaa1"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "苗字が空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end
    it "名前が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "苗字カナが空だと登録できない" do
      @user.family_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Family kana can't be blank"
    end
    it "名前カナが空だと登録できない" do
      @user.first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    it "苗字が漢字・ひらがな・カタカナ以外だと登録できない" do
      @user.family_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end
    it "名前が漢字・ひらがな・カタカナ以外だと登録できない" do
      @user.first_name = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "苗字カナがカタカナ以外だと登録できない" do
      @user.family_kana = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family kana is invalid"
    end
    it "名前カナがカタカナ以外だと登録できない" do
      @user.first_kana = "a"
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana is invalid"
    end
  end
end
