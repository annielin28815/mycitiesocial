class Category < ApplicationRecord
    acts_as_paranoid
    acts_as_list

    # 寫上這段語法，就可以在編輯商品的頁面裡，商品分類那個下拉選單，按照被更改的順序所排列。
    default_scope { order(position: :asc) }

    has_many :products

    validates :name, presence: true
end
