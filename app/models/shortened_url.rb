class ShortenedUrl < ActiveRecord::Base
  include SecureRandom

  validates :short_url, :presence => true, :uniqueness => true

  belongs_to(
    :submitter,
    :class_name => "User",
    :foreign_key => :submitter_id,
    :primary_key => :id
  )

  has_many(
    :visits,
    :class_name => "Visit",
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )

  has_many(
    :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :user
  )

  has_many(
    :taggings,
    :class_name => "Tagging",
    :foreign_key => :shortened_url_id,
    :primary_key => :id
  )

  has_many(
    :tag_topics,
    through: :taggings,
    source: :tag_topic
  )

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

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits.where(created_at < 10.minutes.ago).select(:user_id).distinct.count
  end

end
