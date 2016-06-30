class TagsController < ApplicationController
    before_action :set_tag, only: [:show, :edit, :update, :destroy]

    def index
        @image = Image.find params[:image_id]
        @tags = @image.tags
    end

    def new
        @image = Image.find params[:image_id]
        @tag = @image.tags.new
    end

  # POST /tags
  def create
    # since tag is nexted in an image, params[:image_id] is
    # the id of the image this tag is nested in
    
    @image = Image.find params[:image_id]
    @tag = @image.tags.new(tag_params)
    #@tag.user_id = current_user.id

    # save new tag
    # redirect to tag's image show page
    if @tag.save
        redirect_to image_url(@image), notice: 'Tag was successfully created.'
    else
        redirect_to image_url(@image), notice: 'Tag was NOT created.'
    end
  end

  def destroy
    # params[:id] is the id of the tag to delete
    # look up in db, delete tag
    # redirect to tag's image show page
    @tag = Tag.find params[:id]
    @tag.destroy
    redirect_to image_url(@tag.image), notice: 'Tag was successfully deleted.'
  end

  def edit
    @tag = Tag.find params[:id]#params[:id]
  end

  def update
    # similar to create but the image_id already set
    # redirect to the tag's image show page

    if @tag.update(tag_params)
        redirect_to image_url(@tag.image), notice: 'Tag was successfully updated.'
    end
  end

  private

    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
      params.require(:tag).permit(:str)
    end
end
