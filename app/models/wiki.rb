class Wiki < ActiveRecord::Base
  has_and_belongs_to_many :users

  default_scope order('created_at DESC')

  # scope :publicly_viewable, -> { where(private: false) }
  # scope :visible_to, -> (user) do
  #   if user
  #     all
  #   else
  #     publicly_viewable
  #   end
  # end
  # scope :privately_viewable, -> {where(pvirate: true) }
end
