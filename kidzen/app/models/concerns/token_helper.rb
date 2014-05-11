# Provides common functionality for hashing remember tokens
# for both RegisteredUser and ContentProvider.
# Authors: Nouran T. Attia.
module TokenHelper
  extend ActiveSupport::Concern

  # Generates a random token.
  # Authors: Ahmed H. Ismail, Nouran T. Attia.
  def digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  # Passes token through one way hash.
  # Authors: Ahmed H. Ismail, Nouran T. Attia.
  def new_remember_token
    SecureRandom.urlsafe_base64
  end

end