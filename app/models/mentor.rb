class Mentor < User
    has_many :matches
    has_many :mentees, :through :matches
end
