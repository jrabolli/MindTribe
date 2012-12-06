# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean(1)      default(FALSE)
#

require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_many :microposts, :dependent => :destroy

  has_many :relationships, :foreign_key => "follower_id",
                           :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed

  has_many :reverse_relationships, :foreign_key => "followed_id",
                                   :class_name => "Relationship",
                                   :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower

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


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
                    :length   => { :maximum => 50 }
  
  validates :email, :presence   => true,
                    :format     => { :with => email_regex },
                    :uniqueness => {:case_sensitive => false }
                    
  validates :password, :presence => true,
            :confirmation        => true,
            :length => { :within => 6..40 }
            
            
  before_save :encrypt_password

  after_create :check_and_assign_shared_ids_to_shared_folders  

  
  #self.per_page = 8

  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
      user = find_by_id(id)
      (user && user.salt == cookie_salt) ? user : nil
  end

  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end

  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  
  def feed
    Micropost.from_users_followed_by(self)
  end

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

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
    
end
