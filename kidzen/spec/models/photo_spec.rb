require 'spec_helper'

describe Photo do
  it 'is valid with a description and image' do
    photo = Photo.new(
    description: 'This is a test assignemnt',remote_image_url: 'http://bigwol.com/wp-content/uploads/2014/05/Roses.jpg')
    expect(photo).to be_valid
  end 
end
