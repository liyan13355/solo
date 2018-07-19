require 'rails_helper'

# RSpec.describe "users/index", type: :view do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe "index.html.erb" do
	it "contains unverified users" do
		visit(users_path)
		expect(page.has_content?("All Unverified Users")).to eq(true)
	end
end
