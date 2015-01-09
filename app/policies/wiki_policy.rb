class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    attr_reader :user, :scope

    def resolve
      if user.present? && user.role == 'premium'
        scope.all
      else
        scope.where(private: false)
      end
    end
  end


  def index?
    true
  end



end