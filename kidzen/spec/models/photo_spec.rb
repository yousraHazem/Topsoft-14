require 'spec_helper'

describe Photo do
  it 'is valid with a description and image' do
    photo = Photo.new(
      description: 'test photo',
        remote_image_url: 'http://bigwol.com/wp-content/uploads/2014/05/Roses.jpg')
          expect(photo).to be_valid
  end 
  it 'is not valid without description' do
     photo = Photo.new(
       remote_image_url: 'http://bigwol.com/wp-content/uploads/2014/05/Roses.jpg')
         expect(photo).not_to be_valid
  end
  it 'is not valid without image' do
    photo = Photo.new(
      description: 'Test photo')
        expect(photo).not_to be_valid
  end 
  
end
