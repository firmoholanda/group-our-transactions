require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @user = User.create(name: 'example user', email: 'example@example.com')
    @group = described_class.create!(name: 'computer science 101', icon: 'android', user_id: @user.id)
  end

  it 'is valid' do
    expect(@group).to be_valid
  end

  context 'association tests' do
    it 'belongs to creator' do
      assc = described_class.reflect_on_association(:creator)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has many projects_groups' do
      assc = described_class.reflect_on_association(:projects_groups)
      expect(assc.macro).to eq :has_many
    end

    it 'has many projects' do
      assc = described_class.reflect_on_association(:projects)
      expect(assc.macro).to eq :has_many
    end
  end
end
