module CodeGenerator
    extend ActiveSupport::Concern

    included do
        # 如果是設定、繼承或擴充等功能，推薦寫在上面一點的地方。
        extend FriendlyId
        # 將 slug指定給code這個欄位。
        friendly_id :code_generater, use: :slugged, slug_column: :code

    end

    private
    def code_generater
      SecureRandom.hex(10)
    end
end