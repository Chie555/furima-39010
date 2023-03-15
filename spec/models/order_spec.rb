require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order_payment = FactoryBot.build(:order)
  end

  describe '商品出品' do
    context '内容に問題ない場合' do
      it "全項目が存在すれば購入できる" do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では登録できないこと" do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("PostCode can't be blank")
      end
      it "都道府県が「---」では登録できないこと" do
        @order.prefecture_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空では登録できないこと" do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地が空では登録できないこと" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では登録できないこと" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("PhoneNumber can't be blank")
      end
    end
  end
end
