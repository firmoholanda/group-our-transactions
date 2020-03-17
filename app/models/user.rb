class User < ApplicationRecord

  validates :name, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }

end
