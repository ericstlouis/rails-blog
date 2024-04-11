class Blogpost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  #scope creates a query function for the controller
  #works on a class level
  #similiar to Blogpost.all
  #it will be Blogpost.draft
  #BlogPost.draft -> "Give me all blog posts that are drafts"
  scope :draft, -> { where(is_draft: true) }
  scope :published, -> { where(is_draft: false) }

  # Scope to fetch draft posts for a specific user
  scope :user_drafts, ->(user) { where(user: user, is_draft: true) }

  # Scope to fetch published posts for a specific user
  scope :user_published, ->(user) { where(user: user, is_draft: false) }

  #works on a object level
  #asks is this object a draft
  #post.draft? -> "Is this specific post a draft?"
  def draft?
    is_draft
  end

  def blog_user?(current_user)
    current_user && user_id == current_user.id
  end

  # Think of the scope as a tool for working with sets of blog posts based on their draft status and
  # the instance method as a way of inspecting the draft status of an individual post.
  #
  belongs_to :user
end
