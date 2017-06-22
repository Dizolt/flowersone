class Ability
  include CanCan::Ability

  def initialize(user)

    return unless user.present?
    user ||= User.new

    can :read, :all
  end
end
