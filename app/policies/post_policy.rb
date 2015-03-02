class PostPolicy < ApplicationPolicy 

  class Scope < ApplicationPolicy::Scope

    def resolve
      if !user.present?
        return []
      elsif user.admin? || user.moderator?
        return Post.all
      else
        return user.posts
      end
    end

  end

  def index?
    true
  end

end 