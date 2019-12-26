class UtilitiesController < ApplicationController
  def new
    @utility = Utility.new
  end

  def index
  end

  def show
  end

  def create
      @utility= Utility.new(
            company: utility_params[:company],
            amount: utility_params[:amount],
            date_issued: utility_params[:date_issued],
        )
      
      respond_to do |format|
        begin
            @utility.save
            format.html { redirect_to '/', notice: 'Utility was successfully created.' }
            format.json { render :show, status: :created, location: root }
            
        rescue ActiveRecord::NotNullViolation => e
            puts e.class
            format.html { redirect_to '/', notice: 'Utility was not created' }
            format.json { render :show, status: :unprocessable_entity, location: root }
        
        end
      end
  end

  private

    def utility_params
        params.fetch(:utility, :company, :amount, :date_issued,{})
    end


end
