module SushisHelper
    def created_time_helper(sushi)
        sushi.created_at.strftime("%b %e :: %l:%M %p")
    end

end