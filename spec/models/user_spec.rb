# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do
  before {@user = User.new(name:'Rui', email:'ruiliu889@gmail.com', password:1234567,password_confirmation:1234567)}
  it {@user.should respond_to(:name)}
  it {@user.should respond_to(:email)}
  it {@user.should respond_to(:password)}
  it {@user.should respond_to(:password_confirmation)}
  it {@user.should respond_to(:password_digest)}
  it {@user.should be_valid}

  it "name not present, should not be valid" do
    @user.name = ""
    @user.should_not be_valid
  end

  it "name can not be too long" do
    @user.name = "b"*100
    @user.should_not be_valid
  end

  it "email need to have the right format, if not not valid" do
    @user.email = "23134141"
    @user.should_not be_valid
  end

  it "password should be present" do
    @user.password = ""
    @user.should_not be_valid
  end

  it "password and password_confirmation need be the same" do
    @user.password_confirmation = "7654321"
    @user.should_not be_valid
  end

end
