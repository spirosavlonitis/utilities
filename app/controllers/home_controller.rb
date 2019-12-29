class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
        @fields = {2019 => {}, 2020 => {}}
        @utilities = { 2019 => {}, 2020 => {} }
        current_user.utilities.each_with_index do |utility, i|
            @utilities[utility.date_issued.year.to_i][i] = [
                utility.company, utility.amount, utility.date_issued
            ]
            @fields[2019][utility.company] = 0 if @fields[2019][utility.company] == nil
        end
        @total_2019 = @utilities[2019].values.sum do |e| 
            @fields[2019][e[0]] += e[1]             # add up yearly cost
            e[1]
        end
        @utilities.each do |year, values|
            @utilities[year] = @utilities[year].to_json.html_safe
        end
    end
end
