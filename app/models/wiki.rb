class Wiki < ActiveRecord::Base
  belongs_to :user

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
