class WikiPolicy < ApplicationPolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.present? 
          scope.all
      else
        scope
      end
    end
  end

  def index?
    user.present? 
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end
end
