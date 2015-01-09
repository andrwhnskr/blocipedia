class CollaboratorController < ApplicationController
  def create
    
  end

  def down_grade
    current_user.update_attribute(:role, 'standard')
    current_user.save!    
  end
end
