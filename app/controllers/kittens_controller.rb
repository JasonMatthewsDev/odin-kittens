class KittensController < ApplicationController
    def index
       @kittens = Kitten.all
       
       respond_to { |format| format.json { render json: @kittens }}
    end
    
    def show
       @kitten = Kitten.find_by(id: params[:id])
       
       respond_to { |format| format.json { render json: @kitten }}
    end
    
    def new
       @kitten = Kitten.new
    end
    
    def edit
       @kitten = Kitten.find_by(id: params[:id])
    end
    
    def destroy
        flash[:danger] = Kitten.find_by(id: params[:id]).destroy ? 'Kitten Deleted!' : 'No kitten found'
        redirect_to root_url
    end
    
    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.valid?
            @kitten.save
            flash[:success] = "#{@kitten.name} created!"
            redirect_to @kitten
        else
            flash.now[:danger] = "Failed to create kitten"
            render :new
        end
    end
    
    def update
        @kitten = Kitten.find_by(id: params[:id])
        if @kitten.update(kitten_params)
            flash[:success] = "#{@kitten.name} updated!"
            redirect_to @kitten
        else
            flash.now[:danger] = "Failed to update kitten"
            render :edit
        end
    end
    
    private
    
        def kitten_params
           params.require(:kitten).permit(:name, :age, :cuteness, :softness) 
        end
end
