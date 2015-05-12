class RpgController < ApplicationController

  def index
  	@charTypes = CharType.all
  end

  def show
  	@charTypes = CharType.find(params[:id])
  end

  def new
  	@charTypes = CharType.new
  end

  def create
  	@charTypes = CharType.new(char_params)
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
