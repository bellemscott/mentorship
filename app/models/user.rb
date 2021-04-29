class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    attr_accessor :remember_token
    has_one_attached :avatar
    has_many :mentors 
    has_many :mentees
    has_many :channel_users, dependent: :destroy
    has_many :channels, through: :channel_users
    has_many :messages, dependent: :destroy
    has_secure_password
    before_save { self.email = email.downcase }
    validates :firstname, presence: true
    validates :lastname, presence:true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
    validates :password, presence: true, length: { minimum: 6 }
    validate :can_only_be_either_mentee_or_mentor

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end

    def can_only_be_either_mentee_or_mentor()
        errors.add(:base, 'You cannot be both a mentor and a mentee, please select only one option.') if self.mentor == true && self.mentee== true
    end


    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
        remember_digest
    end

      # Returns a session token to prevent session hijacking.
    # We reuse the remember digest for convenience.
    def session_token
        remember_digest || remember
    end

    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
    def forget
        update_attribute(:remember_digest, nil)
    end

    def get_accepted_matches
        all_matches = Match.all
        matches_to_return = []
        all_matches.each do |match|
            if match.user_id == self.id && match.accepted == true && match.rejected == false
                matches_to_return.push(match)
            end
        end
        return matches_to_return
    end

    def get_all_matches
        all_matches = Match.all
        matches_to_return = []
        all_matches.each do |match|
            if match.user_id == self.id
                matches_to_return.push(match)
            end
        end
        return matches_to_return
    end

end
