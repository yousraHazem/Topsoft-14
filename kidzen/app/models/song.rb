class Song < ActiveRecord::Base
require 'rubygems'
require 'streamio-ffmpeg'
mount_uploader :file, SongUploader
def song_params
      params.require(:song).permit(:name, :file, :real_file)
    end
    def convert
      command = "ffmpeg -y -i #{Rails.root}/public/uploads/song/file/#{self[:id]}/#{self[:file]} #{Rails.root}/public/uploads/song/file/#{self[:id]}/#{self[:id]}.mp3"
      system(command)
      self[:real_file] = "/uploads/song/file/#{self[:id]}/#{self[:id]}.mp3"
      self.save      
    end
end
