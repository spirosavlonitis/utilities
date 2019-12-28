class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
#        p current_user.utilities[0].id, "here"

        @utilities_2019 = {}
        current_user.utilities.each do |utility|
            case utility.date_issued.year.to_i
                when 2019
                    p utility.date_issued.year
                    @utilities_2019[utility.date_issued] = [
                        utility.company, utility.amount
                    ]
            end
        end
        @utilities_2019 = @utilities_2019.to_json.html_safe
    end
end
