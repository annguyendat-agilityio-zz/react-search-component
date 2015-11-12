module AuthenticationHelper
	def current_user
		@current_user ||= FactoryGirl::create(user)
	end
end