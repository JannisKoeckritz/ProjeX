class Todo < ApplicationRecord
	belongs_to :project
	validates :task, presence: true
	validates :level, presence: true
	validates :min_cost, presence: true
	validates :max_cost, presence: true
end
