require 'rails_helper'

RSpec.describe StaticController, type: :controller do
	context 'GET #landingpage' do
		before do
			get :landingpage
		end

		it 'responds successfully with an HTTP 200 status code' do
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it 'renders the landingpage template' do
			expect(response).to render_template('landingpage')
		end
	end

end
