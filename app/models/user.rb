class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@th-wildau+\.[a-z]+\z/i
  validates 	:email, presence: true, uniqueness: { case_sensitive: false },
				length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }

  has_many :user_projects
  has_many :projects, through: :user_projects

  def full_name
  	return "#{first_name} #{last_name}".strip if (first_name || last_name)
  	"Anonymus"
  end
end
