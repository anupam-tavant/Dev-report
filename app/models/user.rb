class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :users_projects
  has_many :projects, through: :users_projects
  has_many :gitlab_stats, dependent: :destroy
  has_many :jira_stats, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  before_validation :get_ldap_email
  def get_ldap_email
    self.email = Devise::LDAP::Adapter.get_ldap_param(self.username,"mail").first
  end

  # hack for remember_token
  def rememberable_value
    Digest::SHA1.hexdigest(email)[0,29]
  end

  def create_or_update_user(user_details, project_id)
    find_or_initliase_by()
  end

end
