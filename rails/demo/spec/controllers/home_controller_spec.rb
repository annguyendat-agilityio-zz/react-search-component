require 'rails_helper'

RSpec.describe HomeController, :type => :controller do
	it "populates an array of users" do
		user = create(:user)
		get :index
		expect(assigns(:users)).to match_array [user]
	end

	it "renders the :index view " do
		get :index
		expect(response).to render_template :index
	end
	it "assigns a new Message to @message" do
		get :new
		expect(assigns(:message)).to be_a_new(Message)
	end
	it "reders the :new template" do
		get :new
		expect(response).to render_template :new
	end
end
