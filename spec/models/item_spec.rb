require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '商品情報登録がうまくいく時' do
      it "全ての情報が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品情報登録がうまくいかないとき' do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報が空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "カテゴリーの情報が--だと登録できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "配送料の負担についての情報が空だと登録できない" do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges is not a number")
      end
      it "配送料の負担についての情報が--だと登録できない" do
        @item.shipping_charges_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it "発送元の地域についての情報が空だと登録できない" do
        @item.shipping_region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region is not a number")
      end
      it "発送元の地域についての情報が--だと登録できない" do
        @item.shipping_region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
      end
      it "発送までの日数についての情報が空だと登録できない" do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is not a number")
      end
      it "発送までの日数についての情報が--だと登録できない" do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end
      it "価格についての情報が空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格についての情報が¥300~¥9,999,999の範囲外の価格では登録できない" do
        @item.price = '299,10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格についての情報が半角数字以外の入力だと登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end