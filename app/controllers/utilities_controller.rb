class UtilitiesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_utility, only: [:destroy, :update, :edit, :show]

  def new
    @utility = Utility.new
  end

  def index
    @utilities_2019 = []
    current_user.utilities.each do |utility|
      case utility.date_issued.year.to_i
        when 2019
          @utilities_2019.push utility
        end
      end
  end

  def show
    @utility
  end

  def create
      @utility= Utility.new(
            user_id: current_user.id,
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
            format.html { redirect_to '/', notice: 'Utility was not created' }
            format.json { render :show, status: :unprocessable_entity, location: root }    
        end
      end
  end

  def edit
  end

  def update
    @utility.update(
      company: utility_params[:company],
      amount: (utility_params[:amount] || 0),
      date_issued: utility_params[:date_issued]
    )
    respond_to do |format| 
      format.html {redirect_to '/', notice: 'Utility entry was successfully updated'}
    end
  end

  def destroy
    @utility.destroy
    respond_to do |format|
      format.html {redirect_to '/', notice: 'Utility entry was successfully deleted'}
      format.json { head(:no_content) }
    end
  end

  private

    def utility_params
        params.fetch(:utility, :company, :amount, :date_issued,{})
    end

    def set_utility
      @utility = Utility.find params[:id]
    end
end
