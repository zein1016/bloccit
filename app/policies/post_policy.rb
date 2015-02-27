class PostPolicy < ApplicationPolicy 


  


  def index?
    if user.admin? || user.id? || user.present?
    else
      false 
    end
  end

end