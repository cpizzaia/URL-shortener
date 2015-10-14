class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :short_url, :presence => true, :uniqueness => true

  def self.random_code
    temp = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: temp)
      temp = SecureRandom.urlsafe_base64
    end

    temp
  end

  def self.create_for_user_and_long_url!(user, long_url)

    s = ShortenedUrl.new({submitter_id: user.id, long_url: long_url})
    s.short_url = ShortenedUrl.random_code
    s.save!

  end



end
