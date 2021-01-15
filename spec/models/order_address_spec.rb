require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it "building_name以外のの項目を全て入力すれば保存できる" do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it "postal_codeにハイフンが入らなければ登録できない" do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code is invalid"
      end
      it "prefecture_idが1だと登録できない" do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it "localが空だと登録できない" do
        @order_address.local = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Local can't be blank"
      end
      it "house_numが空だと登録できない" do
        @order_address.house_num = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House num can't be blank"
      end
      it "tel_numが空だと登録できない" do
        @order_address.tel_num = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tel num can't be blank"
      end
      it "tel_numが12桁以上になると登録できない" do
        @order_address.tel_num = "090123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tel num is too long (maximum is 11 characters)"
      end
      it "tel_numにハイフンが含まれると登録できない" do
        @order_address.tel_num = "090-1234-5678"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Tel num is invalid"
      end
      it "tokenが空では登録できない" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
