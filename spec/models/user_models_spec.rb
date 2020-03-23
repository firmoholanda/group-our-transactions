require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'example user', email: 'example@example.com')
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'name should not be spaces' do
    @user.name = '   '
    expect(@user).to_not be_valid
  end

  it 'email addresses should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(@user).to be_valid
  end

  context 'association tests' do
    it 'has many projects' do
      assc = User.reflect_on_association(:projects)
      expect(assc.macro).to eq :has_many
    end

    it 'has many groups' do
      assc = User.reflect_on_association(:groups)
      expect(assc.macro).to eq :has_many
    end
  end
end
