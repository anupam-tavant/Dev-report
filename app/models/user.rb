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

  def self.create_or_update_user(user_details, project_id: nil)
    user_details.each do |user_record|
      user = find_or_initialize_by(username: user_record["username"])
      if !user.id
        user.assign_attributes(email: user_record["username"]+"@tavant.com", password: "Welcome123")
        user.save(validate: false)
      end
      UsersProject.set_user_project(user.id, project_id, gitlab_enabled: true) if project_id
    end
  end

end
