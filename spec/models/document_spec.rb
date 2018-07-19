require 'rails_helper'


RSpec.describe Document, type: :model do

	let(:correct_deadline) { "01-01-2020" }
	let(:wrong_deadline) { "01-01-2017" }



	context "creates: " do
		it "accepts the value of correct_deadline" do
			expect{ Document.create(deadline: correct_deadline.to_date) }.not_to raise_error
		end

		it "won't create an entry without file_name being filled in" do 
			Document.create(deadline: correct_deadline.to_date)
			expect( Document.find_by(deadline: correct_deadline.to_date) ).to be nil
		end

		it "creates legitimate entry" do
			expect{ Document.create(deadline: correct_deadline.to_date, file_name: 'Tester') }.not_to raise_error
		end

		it "will be found!" do
			Document.create(deadline: correct_deadline.to_date, file_name: 'Tester') 
			expect( Document.find_by(file_name: 'Tester') ).not_to be nil
		end

		
	end

end


