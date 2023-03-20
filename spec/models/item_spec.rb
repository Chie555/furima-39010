require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it '全項目が存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it '画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('商品画像を入力してください')
      end
      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明を入力してください')
      end
      it 'category_idが「---」では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'condition_idが「---」では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'ship_fee_idが「---」では出品できない' do
        @item.ship_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'prefecture_idが「---」では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it 'ship_date_idが「---」では出品できない' do
        @item.ship_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格を入力してください')
      end
      it '全角文字を含むpriceでは出品できない' do
        @item.price = '５00'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値（整数）の300円〜9,999,999円の範囲内で入力してください')
      end
      it '300円未満のpriceでは出品できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値（整数）の300円〜9,999,999円の範囲内で入力してください')
      end
      it '9,999,999円を超えるpriceでは出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値（整数）の300円〜9,999,999円の範囲内で入力してください')
      end
      it 'priceに小数点以下を含めた値では出品できない' do
        @item.price = '1000.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は半角数値（整数）の300円〜9,999,999円の範囲内で入力してください')
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
