class Ability
	include CanCan::Ability

	def initialize(user)
		
		user ||= User.new

		if user.admin?
			can :manage, :all
		else
			can :manage, User, id: user.id
			can :manage, Order, id: user.id
			can :read, Product
			
		end
	end
end
