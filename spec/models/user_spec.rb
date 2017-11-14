require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new(first_name:'Finn', last_name:'LeFinn', email:'finn@finn.finn', password:'finn', password_confirmation:'finn')
    end

    it 'should be a vaild user' do
      expect(@user).to be_valid
    end

    it 'is not a valid user without first name' do
      @user.first_name = nil
      expect(@user).not_to be_valid
    end

    it 'is not a valid user without last name' do
      @user.last_name = nil
      expect(@user).not_to be_valid
    end

    it 'is not a valid user without email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'is not a valid user if without matching password confirmation' do
      @user.password_confirmation = 'notfinn'
      expect(@user).not_to be_valid
    end

    it 'is not a vaild user if email is taken' do
      @user.save
      @new_user = @user.dup
      expect(@new_user).not_to be_valid
    end

    it 'is not a valid password if under 4 characters' do
      @user.password = 'fin'
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(first_name:'Finn', last_name:'LeFinn', email:'finn@finn.finn', password:'finn', password_confirmation:'finn')
      @user_authentication = @user.authenticate_with_credentials(@user.email, @user.password)
    end
    
    it 'should authenticate user' do
      @user.save
      expect(@user_authentication).to eq @user
    end

    it 'should authenticate regardless of email case' do
      @user.save
      @user.email = 'fiNn@FINN.finn'
      expect(@user_authentication).to eq @user
    end
  end
  
end
