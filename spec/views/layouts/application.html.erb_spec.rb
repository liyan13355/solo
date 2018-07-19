require 'rails_helper'

# RSpec.describe "urls/index.html.erb", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe 'application.html.erb' do
	it 'contains \'Home\' ' do
		visit('/')
		# expect(page.has_content?('Sort')).to eq(true)
		expect(page).to have_content("Home")
	end

	context 'ajax links' do
		it 'should render the login page' do
			visit('/')
			click_link('Log In')
			expect(page.has_content?("Log In")).to eq(true)
		end
	end
	
end