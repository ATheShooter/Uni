class UniversitiesController < ApplicationController
	before_action :find_uni, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]
    
	def index
		if params[:category].blank?
			@universities = University.all.order('created_at DESC')
		else
			@category_id = Category.find_by(name: params[:category]).id
			@universities = University.where(:category_id => @category_id).order('created_at DESC')
		end
	end

	def new 

	  @university = current_user.universities.build
	  @categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def show 
		if @university.reviews.blank?
			@average_review = 0
		else
			@average_review = @university.reviews.average(:rating).round(2)
		end
	end

	def create 

	  @university = current_user.universities.build(university_params)
	  @university.category_id = params[:category_id]
	  if @university.save
	  	redirect_to root_path
	  else
	  	render 'new'
	  end
	end

	def edit
		@categories = Category.all.map{ |c| [c.name, c.id] }
	end

	def update
		@university.category_id = params[:category_id]
	  if @university.update(university_params)
	  	redirect_to university_path(@university)
	  else
	  	render 'edit'
	  end
	end

	def destroy
		@university.destroy
		redirect_to root_path
	end

	private 

	def university_params 
		params.require(:university).permit(:name,:description,:location,:category_id, :uni_image)
	end

	def find_uni
		@university = University.find(params[:id])
	end
end
