class User < ActiveRecord::Base
  validates :email, :presence => true, :uniqueness => true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, messsage: "invalid email" }

  has_many(
    :submitted_urls,
    :class_name => "ShortenedUrl",
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
    :visited_urls,
    Proc.new { distinct },
    through: :visits,
    source: :shortened_url
  )
end
