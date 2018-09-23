class Project < ApplicationRecord
	has_many :user_projects
	has_many :users, through: :user_projects
	validates :project_name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :goal, presence: true, length: { minimum: 5, maximum: 500 }
	validates :deadline, presence: true
	validates :created_by, presence: true
end
