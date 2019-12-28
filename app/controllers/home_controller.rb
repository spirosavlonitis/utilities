class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
#        p current_user.utilities[0].id, "here"

        @utilities = {}
        current_user.utilities.each do |utility|
            p utility
            @utilities[utility.date_issued] = [
                utility.company, utility.amount
            ]
        end
        @utilities = @utilities.to_json.html_safe
    end
end
