class Ability
  include CanCan::Ability
  def initialize(user)
    if user.present?
      if user.role.name == 'admin'
        can :manage, :all
      elsif user.role.name == 'customer'
        can :read, :all
        can :create , Sale
      else
        can :approve , Sale
        can :disapprove, Sale
        can :manage , Product
        can :create , Sale
        can :read, :all
      end
    else
      can :read, :all
    end
  end
end
