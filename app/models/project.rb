class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	has_many :todos
	validates :project_name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :goal, presence: true, length: { minimum: 5, maximum: 500 }
	validates :created_by, presence: true
	# VALID_EMAIL_REGEX = /\A[\w+\-.]+@th-wildau+\.[a-z]+\z/i
  validates 	:deadline, presence: true
				# , format: { with: VALID_EMAIL_REGEX }
end
