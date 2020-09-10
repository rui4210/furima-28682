require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '配送先登録' do
    before do
      @orderpruchase = FactoryBot.build(:order_purchase)
    end

    context '配送先情報登録がうまくいく時' do
      it "全ての情報が存在すれば登録できる" do
        expect(@orderpruchase).to be_valid
      end
    end

    context '配送先情報登録がうまくいかないとき' do
      it "郵便番号が空だと登録できない" do
        @orderpruchase.post_number = ''
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Post number can't be blank")
      end
      it "都道府県が空だと登録できない" do
        @orderpruchase.prefecture = ''
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Prefecture can't be blank")
     end
      it "市区町村が空だと登録できない" do
        @orderpruchase.city = ''
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空だと登録できない" do
        @orderpruchase.address = ''
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Address can't be blank")
      end
        it "電話番号が空だと登録できない" do
        @orderpruchase.phone_number = ''
       @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "都道府県の情報が--だと登録できない" do
        @orderpruchase.prefecture = 1
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "郵便番号で-（ハイフン）を含めないと登録できない" do
        @orderpruchase.post_number = '0000000'
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Post number is invalid")
      end
      it "電話番号で11桁以内出ないと登録できない" do
        @orderpruchase.post_number = '000000000000'
        @orderpruchase.valid?
        expect(@orderpruchase.errors.full_messages).to include("Post number is invalid")
      end
    end
  end
end
