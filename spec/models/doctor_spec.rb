require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject do
    Doctor.create!(name: 'abid', city: 'kabul', description: 'good doctor', image: 'image', speciality: 'dentist')
  end
  before { subject.save }

  it 'should have a name' do
    expect(subject.name).to eq('abid')
  end

  it 'should have a city' do
    expect(subject.city).to eq('kabul')
  end

  it 'should have a description' do
    expect(subject.description).to eq('good doctor')
  end

  it 'should have an image' do
    expect(subject.image).to eq('image')
  end

  it 'should have a speciality' do
    expect(subject.speciality).to eq('dentist')
  end

  it 'name, city, description and speciality should be equl or grater than 3 characters and less than 50' do
    expect(subject.name.length).to be >= 3
    expect(subject.city.length).to be >= 3
    expect(subject.description.length).to be >= 3
    expect(subject.speciality.length).to be >= 3
    expect(subject.name.length).to be <= 50
    expect(subject.city.length).to be <= 50
    expect(subject.description.length).to be <= 50
    expect(subject.speciality.length).to be <= 50
  end

  it 'should have many appointments' do
    expect(subject.appointments).to eq([])
  end
end
