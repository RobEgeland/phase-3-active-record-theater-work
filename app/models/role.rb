class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        actors_arr = []
        self.auditions.each do |audition|
            actors_arr << audition.actor
        end
        actors_arr
    end

    def locations
        locations_arr = []
        self.auditions.each do |audition|
            locations_arr << audition.location
        end
        locations_arr
    end

    def lead
        self.auditions.each do |audition|
            return audition if audition.hired == true
        end
        'no actor has been hired for this role'
    end

    def understudy
        hired_arr = []
        self.auditions.each do |audition|
            hired_arr << audition if audition.hired == true
        end

        if !hired_arr[1] 
            'no actor has been hired for understudy for this role'
        else
            hired_arr[1]
        end
    end
end