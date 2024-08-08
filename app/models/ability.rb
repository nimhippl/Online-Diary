class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :access, :admin_dashboard
      cannot :access, :teacher_dashboard
    elsif user.teacher?
      can :access, :teacher_dashboard
      cannot :access, :admin_dashboard
    else
      cannot :access, :admin_dashboard
      cannot :access, :teacher_dashboard
    end
  end
end
