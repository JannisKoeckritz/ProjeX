class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@th-wildau+\.[a-z]+\z/i
  validates 	:email, presence: true, uniqueness: { case_sensitive: false },
				length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
	validates :first_name, presence: true, length: { minimum: 2 }
	validates :last_name, presence: true, length: { minimum: 3 }
	validates :username, presence: true, length: { minimum: 3 }
  has_many :user_projects, dependent: :destroy
  has_many :projects, through: :user_projects
  has_many :user_todos, dependent: :destroy
  has_many :todos, through: :user_todos

  def full_name
  	return "#{first_name} #{last_name}".strip if (first_name || last_name)
  	"Anonymus"
  end

  def self.search(param)
    param.strip!
    param.downcase!
    to_send_back = (first_name_matches(param) + last_name_matches(param) + email_matches(param)).uniq
    return nil unless to_send_back
    to_send_back
  end

  def self.first_name_matches(param)
    matches('first_name', param)
  end

  def self.last_name_matches(param)
    matches('last_name', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.matches(field_name, param)
    User.where("#{field_name} like ?", "%#{param}%")
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

end
