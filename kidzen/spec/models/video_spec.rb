require 'spec_helper'

describe Photo do
  it 'is valid with a description and video' do
    video = Video.new(
      description: 'test video',
        youtube: 'https://www.youtube.com/watch?v=fSJruNAS3BY')
          expect(video).to be_valid
  end 
  it 'is not valid without description' do
     video = Video.new(
       youtube: 'https://www.youtube.com/watch?v=fSJruNAS3BY')
         expect(video).not_to be_valid
  end
  it 'is not valid without video' do
    video = Video.new(
      description: 'Test video')
        expect(video).not_to be_valid
  end 
  
end
