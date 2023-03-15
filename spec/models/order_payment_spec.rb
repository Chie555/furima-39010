require 'rails_helper'

RSpec.describe OrderPayment, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_payment = FactoryBot.build(:order_payment, item_id: item.id, user_id: user.id)
  end

  describe '商品出品' do
    context '内容に問題ない場合' do
      it '全項目が存在すれば購入できる' do
        expect(@order_payment).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order_payment.building = ''
        expect(@order_payment).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空では購入できないこと' do
        @order_payment.token = nil
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では購入できないこと' do
        @order_payment.post_code = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が数字のみでは購入できないこと' do
        @order_payment.post_code = '0000000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号のハイフンの前が3桁以外なら購入できないこと' do
        @order_payment.post_code = '0-0000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号のハイフンの後が4桁以外なら購入できないこと' do
        @order_payment.post_code = '000-00000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号に全角が含まれていたら購入できないこと' do
        @order_payment.post_code = '０００-0000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が「---」では購入できないこと' do
        @order_payment.prefecture_id = '1'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では購入できないこと' do
        @order_payment.municipalities = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では購入できないこと' do
        @order_payment.address = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できないこと' do
        @order_payment.phone_number = ''
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンが含まれていたら購入できないこと' do
        @order_payment.phone_number = '000-0000000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が10,11桁以外だと購入できないこと' do
        @order_payment.phone_number = '000000000000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に全角が含まれていたら購入できないこと' do
        @order_payment.phone_number = '０００0000000'
        @order_payment.valid?
        expect(@order_payment.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
