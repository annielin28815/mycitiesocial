class Vendor < ApplicationRecord
    acts_as_paranoid
    validates :title, presence: true



    # 方法1
    scope :available, -> {where(online: true)}

    # 方法2
    # def self.available
    #     where(online: true)
    # end
end