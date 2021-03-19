class Mentee < User
    has_many :mentors
    has_many :mentors, :through :matches
end
