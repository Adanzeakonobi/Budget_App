class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Category, user: user
    can :manage, Record, user:
  end
end
