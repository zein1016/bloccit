module Pagination

  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def paginate(args = {}, page)
      self.limit(10).offset(page * 10)
    end  
  end

end