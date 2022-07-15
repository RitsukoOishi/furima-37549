require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
  end

  describe '商品新規登録' do
    context '新規登録できる場合' do
      it "image,title,contet,fenre_id,prefecture_id,days_num_id,pricenameが存在すれば登録できる" do
        expect(@furima).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "imageが空では登録できない" do
        @furima.image = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @furima.title = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Title can't be blank")
      end
      it "contentが空では登録できない" do
        @furima.content = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Content can't be blank")
      end
      it "genre_idが1では登録できない" do
        @furima.genre_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Genre can't be blank")
      end
      it "condition_idが1では登録できない" do
        @furima.condition_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Condition can't be blank")
      end
      it "fee_idが1では登録できない" do
        @furima.fee_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Fee can't be blank")
      end
      it "prefecture_idが1では登録できない" do
        @furima.prefecture_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "days_num_idが1では登録できない" do
        @furima.days_num_id = 1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Days num can't be blank")
      end
      it "priceが空では登録できない" do
        @furima.price = ''
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price can't be blank")
      end
      it "titleが40文字より多いと登録できない" do
        @furima.title = Faker::Lorem.characters(number: 41)
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Title is too long (maximum is 40 characters)") 
      end
      it "contentが1,000文字より多いと登録できない" do
        @furima.content = Faker::Lorem.characters(number: 1001)
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")         
      end
      it "priceが300より小さいと登録できない" do
        @furima.price = 299
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be greater than or equal to 300")         
      end
      it "priceが小数点であると登録できない" do
        @furima.price =300.1
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be an integer")
      end
      it "priceが文字列であると登録できない" do
        @furima.price ="aaa"
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price is not a number")
      end
      it "priceが9,999,999より大きいと登録できない" do
        @furima.price =10000000
        @furima.valid?
        expect(@furima.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it "ユーザーが紐づいていないと登録できない" do
        @furima.user = nil
        @furima.valid?
        expect(@furima.errors.full_messages).to include("User must exist")
      end
    end
  end
end
