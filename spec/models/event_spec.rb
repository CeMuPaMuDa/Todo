require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { build(:event) }
  
  context 'в невалидном состоянии' do
  let(:event) { build(:event_wrong) }

    it 'когда пустое название' do
      expect(event.validate).to be_falsey
      error_message = 'Название не может быть пустым'
      expect(event.errors.full_messages).to include error_message
    end

    it 'когда отсутствует владелец' do
      expect(event.validate).to be_falsey
      error_message = 'User не может отсутствовать'
      expect(event.errors.full_messages).to include error_message
    end
end

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to belong_to(:user)}
  it { is_expected.to have_many(:items).dependent(:destroy) }
end