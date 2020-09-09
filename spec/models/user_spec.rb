require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "すべての値が存在すれば登録できること" do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'last_nameが空だと保存できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空だと保存できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'emailが空だと保存できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空だと保存できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'birth_dayが空だと保存できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "000aa"
      @user.encrypted_password = "000aa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'last_nameが全角日本語でないと保存できないこと' do
      @user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name は全角で入力してください。")
    end
    it 'first_nameが全角日本語でないと保存できないこと' do
      @user.first_name = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name は全角で入力してください。")
    end
    it 'last_name_readingがカタカナ日本語でないと保存できないこと' do
      @user.last_name_reading = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name reading は全角カタカナで入力して下さい。")
    end
    it 'first_name_readingがカタカナ日本語でないと保存できないこと' do
      @user.first_name_reading = "taro"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name reading は全角カタカナで入力して下さい。")
    end
  end
end
