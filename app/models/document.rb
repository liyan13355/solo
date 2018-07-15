class Document < ApplicationRecord
	validates :deadline, presence: true
	validates :file_name, presence: true
	
end
