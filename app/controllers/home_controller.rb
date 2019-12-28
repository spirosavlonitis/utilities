class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
        @utilities_2019 = {}
        current_user.utilities.each_with_index do |utility, i|
            case utility.date_issued.year.to_i
                when 2019
                    @utilities_2019["2019_#{i}"] = [
                        utility.company, utility.amount, utility.date_issued
                    ]
            end
        end
        @total_2019 = @utilities_2019.values.sum { |e| e[1] }
        @utilities_2019 = @utilities_2019.to_json.html_safe
    end
end
