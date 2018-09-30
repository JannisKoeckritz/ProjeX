class Todo < ApplicationRecord
	has_many :user_todos, dependent: :destroy
	has_many :users, through: :user_todos
	belongs_to :project
	validates :task, presence: true
	validates :level, presence: true
	validates :min_cost, presence: true
	validates :max_cost, presence: true
end
