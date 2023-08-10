class EventsController < ApplicationController
    #before_action :authenticate_user!
    
    def index
    
        @events = Event.all
    end

    def show
        
        @event = Event.find(params[:id])
    end

   def new

        @event = Event.new
    end

    

    def create
        
        @event = Event.new(event_params)
        @event.administrator = current_user
        if @event.save
            
            redirect_to @event
        else
            puts @event.errors.full_messages
            render :new
        end
    end
    

    private
    
    def event_params
        params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
