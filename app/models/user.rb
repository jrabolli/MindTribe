# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean(1)      default(FALSE)
#  password_digest :string(255)
#  remember_token  :string(255)
#


class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
  def feed
    Micropost.from_users_followed_by(self)
  end





has_many :clippings
has_many :folders

  #this is for folders which this user has shared  
  has_many :shared_folders, :dependent => :destroy  
  
  #this is for folders which the user has been shared by other users  
  has_many :being_shared_folders, :class_name => "SharedFolder", :foreign_key => "shared_user_id", :dependent => :destroy  

  #this is for getting Folders objects which the user has been shared by other users  
  has_many :shared_folders_by_others, :through => :being_shared_folders, :source => :folder  

  #added for tribes??
  belongs_to :tribe
  ###

  after_create :check_and_assign_shared_ids_to_shared_folders  


  #this is to make sure the new user ,of which the email addresses already used to share folders by others, to have access to those folders  
  def check_and_assign_shared_ids_to_shared_folders      
    #First checking if the new user's email exists in any of ShareFolder records  
    shared_folders_with_same_email = SharedFolder.find_all_by_shared_email(self.email)  
  
    if shared_folders_with_same_email        
      #loop and update the shared user id with this new user id   
      shared_folders_with_same_email.each do |shared_folder|  
        shared_folder.shared_user_id = self.id  
        shared_folder.save  
      end  
    end      
  end  


  #to check if a user has acess to this specific folder  
def has_share_access?(folder)  

    # doesn't have share access if folder is nil (i.e., file is top-level)
    return false if folder.nil?

    #has share access if the folder is one of one of his own  
    return true if self.folders.include?(folder)  
  
    #has share access if the folder is one of the shared_folders_by_others  
    return true if self.shared_folders_by_others.include?(folder)  
  
    #for checking sub folders under one of the being_shared_folders  
    return_value = false  
  
    folder.ancestors.each do |ancestor_folder|  
    
      return_value = self.being_shared_folders.include?(ancestor_folder)  
      if return_value #if it's true  
        return true  
      end  
    end  
  
    return false  
end  
  

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
