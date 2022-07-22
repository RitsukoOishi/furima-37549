require 'rails_helper'

RSpec.describe RecordDelivery, type: :model do
  describe '購入記録の保存' do
    before do
      user = FactoryBot.create(:user)
      furima = FactoryBot.create(:furima)
      @record_delivery = FactoryBot.build(:record_delivery, user_id: user.id, furima_id: furima.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_delivery).to be_valid
      end
      it 'building_numberは空でも保存できること' do
        @record_delivery.building_number = ''
        expect(@record_delivery).to be_valid
      end
      it 'phoneは10桁でも保存できること' do
        @record_delivery.phone = '0123456789'
        expect(@record_delivery).to be_valid
      end 
      it 'phone0以外の番号から始まっても保存ができる' do
        @record_delivery.phone = '12345678901'
        expect(@record_delivery).to be_valid
      end     
      
    end

    context '内容に問題がある場合' do
      it 'tokenが空では保存できないこと' do
        @record_delivery.token = nil
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Token can't be blank")
      end
      
      it 'post_codeが空だと保存できないこと' do
        @record_delivery.post_code = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_delivery.post_code = '1234567'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @record_delivery.prefecture_id = 1
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @record_delivery.city = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'houseが空だと保存できないこと' do
        @record_delivery.house = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("House can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @record_delivery.phone = ''
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneがハイフンを含むと保存できないこと' do
        @record_delivery.phone = '090-1234-56789'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'phone9桁より少ないと保存できない' do
        @record_delivery.phone = '012345678'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'phone11桁より多いと保存できない' do
        @record_delivery.phone = '090123456789'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが半角数字以外だと保存ができない' do
        @record_delivery.phone = '０９０１２３４５６７８'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneにアルファベットが含まれると保存ができない' do
        @record_delivery.phone = 'abcdefghijk'
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_delivery.user_id = nil
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'furimaが紐付いていないと保存できないこと' do
        @record_delivery.furima_id = nil
        @record_delivery.valid?
        expect(@record_delivery.errors.full_messages).to include("Furima can't be blank")
      end
    end
  end
end
