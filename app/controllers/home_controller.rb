class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
        @utilities = {}
        Utility.all.each do |utility|        
            @utilities[utility.date_issued] = [
                utility.company, utility.amount
            ]
        end
        @utilities = @utilities.to_json.html_safe
    end
end
