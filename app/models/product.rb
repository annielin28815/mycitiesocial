class Product < ApplicationRecord
  include CodeGenerator

  has_rich_text :description
  has_one_attached :cover_image

  # 驗證是否為存在的
  validates :name, presence: true
  # 驗證是否為存在的、並驗證數字是大於0且
  validates :list_price, :sell_price, numericality: { greater_than: 0, allow_nil: true}
  # 驗證是否為獨有的
  validates :code, uniqueness: true

  # relationships
  # 因為在rails5之後，強制要填belongs_to...，但如果有不想填的狀況，可在後面加「optional: true」。
  belongs_to :category, optional: true
  belongs_to :vendor
  has_many :skus
  # 下面這行代表有很多有關sku的巢狀屬性。
  # reject_if: :all_blank代表如果資訊是空的，就無法寫入成功。
  # allow_destroy: true代表打錯時允許被刪除。
  accepts_nested_attributes_for :skus, reject_if: :all_blank, allow_destroy: true

end
