class Post < ApplicationRecord
  belongs_to :user
  has_rich_text :body
  has_one_attached :image
  acts_as_list add_new_at: :top, top_of_list: 0
  
  validates :title, presence: true

  scope :ordered, -> { order(position: :asc) }
  scope :published, -> { where(published: true) }
  
  def image_or_default
    if self.image.attached?
      self.image.url
    else
      ActionController::Base.helpers.asset_url('post_default.jpg')
    end
  end

  def published_icon
    if self.published
      Icon.call("published")
    else
      Icon.call("unpublished")
    end
  end
end
