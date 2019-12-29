class HomeController < ApplicationController

    before_action :authenticate_user!

    def index
        @fields = {2019 => {}, 2020 => {}}
        @utilities = { 2019 => {}, 2020 => {} }
        @total = {2019 => 0, 2020 => 0}
        
        current_user.utilities.each_with_index do |utility, i|
            year = utility.date_issued.year.to_i
            @utilities[year][i] = [
                utility.company, utility.amount, utility.date_issued
            ]
            @fields[year][utility.company] = 0 if @fields[year][utility.company] == nil # initilize company
        end
        
        [2019, 2020].each do |year|
            @total[year] = @utilities[year].values.sum do |e| 
                @fields[year][e[0]] += e[1]             # add up company yearly cost
                e[1]
            end
        end
        
        @utilities.each do |year, values|       # make safe for js usage
            @utilities[year] = @utilities[year].to_json.html_safe
        end
    end
end
