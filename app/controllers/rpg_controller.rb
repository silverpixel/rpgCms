class RpgController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # Listing of all characters
    #@charTypes = CharType.all
    user = current_user.id
  	@charTypes = CharType.where("user_id = '#{user}'")
  end

  def show
  	@charTypes = CharType.find(params[:id])
  end

  def new
  	@charTypes = current_user.char_types.build
  end

  def create
  	@charTypes = current_user.char_types.build(char_params)
  	if @charTypes.save
  		redirect_to(:action => 'index')
  	else
  		render('new')
  	end
  end

  def edit
  	@charTypes = CharType.find(params[:id])
  end

  def update
  	@charTypes = CharType.find(params[:id])
  	if @charTypes.update_attributes(char_params)
  		redirect_to(:action => 'show', :id => @charTypes.id)
  	else
  		render('edit')
  	end
  end

  def delete
  	@charTypes = CharType.find(params[:id])
  end

  def destroy
  	charTypes = CharType.find(params[:id]).destroy
  	redirect_to(:action => 'index')
  end


  private

  def char_params
  	params.require(:char_type).permit(:name)
  end
end
