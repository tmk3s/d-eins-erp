class Company < ApplicationRecord
  belongs_to :prefecture

  validates :name, presence: true, length: { maximum: 50 }
  validates :post_code1, presence: true, length: { is: 3 }
  validates :post_code2, presence: true, length: { is: 4 }
  validates :address, length: { maximum: 200 }
  validates :building, length: { maximum: 200 }
  validate :validate_post_code

  private

  def validate_post_code
    return if PostCode.where(post_code: post_code1.to_s + post_code2.to_s).exists?
    errors.add(:base, "存在しない郵便番号です")
  end
end
