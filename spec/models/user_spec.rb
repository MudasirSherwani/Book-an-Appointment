require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'ali', email: 'ali@gmail.com', password: '123433') }

  before { subject.save }

  it 'should have a name' do
    expect(subject.name).to eq('ali')
  end

  it 'should have an email' do
    expect(subject.email).to eq('ali@gmail.com')
  end

  it 'should have a password' do
    expect(subject.password).to eq('123433')
  end

  it 'should have many appointments' do
    expect(subject.appointments).to eq([])
  end

  it 'name, email and password should be equl or grater than 3 characters' do
    expect(subject.name.length).to be >= 3
    expect(subject.email.length).to be >= 3
    expect(subject.password.length).to be >= 3
  end
end
