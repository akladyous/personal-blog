class Posts::TagsController < ApplicationController
    before_action :set_tag #, only: %i[ show edit update destroy ]

    def index
      @tags = Post.find(params[:post_id]).tags
    end

    def show
    end

    def new
      @tag = Tag.new
    end

    def edit
    end

    def create
      @tag = Tag.new(tag_params)

      respond_to do |format|
        if @tag.save
          format.html { redirect_to tag_url(@tag), notice: "Tag was successfully created." }
          format.json { render :show, status: :created, location: @tag }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @tag.update(tag_params)
          format.html { redirect_to tag_url(@tag), notice: "Tag was successfully updated." }
          format.json { render :show, status: :ok, location: @tag }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @tag.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @tag.destroy

      respond_to do |format|
        format.html { redirect_to tags_url, notice: "Tag was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_tag
        @post = Post.find(params[:post_id])
      end

      # Only allow a list of trusted parameters through.
      def tag_params
        params.require(:tag).permit(:post_id, :name)
      end
  end
