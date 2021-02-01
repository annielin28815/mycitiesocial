class ApplicationController < ActionController::Base

    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    #  unless: :backend? 就是除了後台以外的，都會做出這個效果。
    #  後台判斷的方法在第17~20行。
    before_action :find_categories, unless: :backend?


    private
    def record_not_found
        render file: "#{Rails.root}/public/404.html",
               layout: false,
               status: 404
    end

    def backend?
        # 用拆開後的方法去判斷，如果是Admin的話，那就代表是後台的。
        controller_path.split('/').first == 'Admin'
    end

    def find_categories
        @categories = Category.order(position: :asc)
    end
end
