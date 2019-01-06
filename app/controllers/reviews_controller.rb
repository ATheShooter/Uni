class ReviewsController < ApplicationController
	before_action :find_university # this used to find which book we are in before we start with deal with review
    before_action :find_review, only: [:edit, :update, :destroy] # this is to find the review that e are in by ID
    before_action :authenticate_user!, only: [:new, :edit] #this to redirectthe un athunticated user to login in page if they try to createor update review 

  # this method is to make a new review 
    def new
    	@review = Review.new
    end

     # create new review 
    def create 
    	@review = Review.new(review_params)
    	@review.university_id = @university.id # add the university id into reviews 
    	@review.user_id = current_user.id   # add the user id into the review 

    	if @review.save
    		redirect_to university_path(@university)
    	else
    		render 'new'
    	end
    end

    def edit
    end

    def update
    	if @review.update(review_params)
    		redirect_to university_path(@university)
    	else
    		render 'edit'
    	end
    end

    	def destroy
    		@review.destroy
    		redirect_to university_path(@university)
    	end

    private 

    # this function is used to pass the pareter into create privately 
    def review_params
    	params.require(:review).permit(:rating, :comment)
    end

    def find_university # here we are defind the function to specify in which university we are 
  		@university = University.find(params[:university_id])
  	end


  	# this is function to find the review by id 
	def find_review 
  		@review = Review.find(params[:id])
  	end
end
