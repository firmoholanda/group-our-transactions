class User < ApplicationRecord

  validates :name, presence: true, length: { minimum: 3, maximum: 10 }, uniqueness: { case_sensitive: false }
  validate :check_empty_space

  def check_empty_space
    if self.attribute.match(/\s+/)
      errors.add(:attribute, "no empty spaces please...")
    end
  end

end
