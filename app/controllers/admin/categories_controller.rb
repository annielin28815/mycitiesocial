class Admin::CategoriesController < Admin::BaseController
    before_action :find_category, only: [:edit, :update, :destroy, :sort]

    def index
        @categories = Category.all.order(position: :asc)
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to admin_categories_path, notice: '新增分類成功'
        else
            render :new
        end
    end

    def destroy
        @category.destroy
        redirect_to admin_categories_path, notice: '分類已刪除'
    end

    def sort
        # insert_at是acts_as_list這個套件給的功能，不是rails本身的。
        # 因為position是從1開始(通常程式裡的陣列從0開始)，所以才寫「i+1」。
        category.insert_at(params[:to].to_i + 1)
        render json: {status: 'OK'}
    end


    private

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
