class PostPolicy < ApplicationPolicy 

 class Scope < Scope
    def resolve 
      if user.nil?
        scope.none
      elsif user.admin? || user.moderator?
        scope.all

      elsif user.present?
        # Post.where(user: user)
        # Post.where(user_id: user.id)
        scope.where(user: user)
      end
    end
  end

  def index?
    user.present?
    # user.present? && (user.admin? || user.moderator?)
  end
      

end
 
