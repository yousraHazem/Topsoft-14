require 'securerandom'
class HomeController < ApplicationController


    # This function creates a new recording.
    # @files is initial variable of type file
    # Author: Ali A. Halawaty.
    def record
        @files = AudioFiles.where(ip: request.remote_ip.to_s).order("created_at DESC")
    end
    # This function saves the recording in the computer of the user.
    # Author: Ali A. Halawaty.
    def saveRecording
      audio = params["record"]["audio"]
      filename = SecureRandom.hex
      save_path = Rails.root.join("public/audioClips/#{filename}.wav")
      File.open(save_path,"wb") do |f|
        f.write audio.read
      end
      AudioFiles.create(ip: request.remote_ip.to_s, filename: filename)
      render nothing: true
    end
    # This function deletes the recording.
    # Author: Ali A. Halawaty.
    def delete
        file = AudioFiles.find(params[:id])
        if(file.ip == request.remote_ip)
            file.destroy
            path = Rails.root.join("public/audioClips/#{file.filename}.wav")
            `rm #{path}`
        end
        redirect_to(action: "record")
    end


end
