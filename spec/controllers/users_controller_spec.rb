require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	let(:user) { @user = FactoryGirl.create(:user) }
	let(:user2) { @user2 = FactoryGirl.create(:user) }
	
	describe "GET#show" do
		
		context 'User is logged in' do
			before do
				sign_in user
			end

			it 'loads correct user details' do
				get :show, id: user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq user
			end
		end

		context 'No user is logged in' do
			it 'redirects to login' do
				get :show, id: user.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to('/my/sign_in')
			end
		end

		context 'user cannot see user2 show page' do
			before do
				sign_in user
			end

			it 'redirects to root_path' do
				get :show, id: user2.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end
	end

end
