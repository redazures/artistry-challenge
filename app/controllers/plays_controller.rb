class PlaysController < ApplicationController
    before_action :find_play, only: [:show, :edit, :update, :destroy]

    def index
        @plays=Play.all
    end

    def show;end

    def new 
        @play=Play.new
    end

    def create 
        @play=Play.create(play_params)
        if @play.valid?
            redirect_to artist_path(@play.artist)
        else
            flash[:errors]=@play.errors.full_messages
            redirect_to new_play_path
        end

    end

    def edit;end

    def update
        @play.update(play_params)
        if @play.valid?
            redirect_to play_path(@play)
        else
            flash[:errors]=@play.errors.full_messages
            redirect_to edit_play_path
        end
    end

    private
    def play_params
        params.require(:play).permit(:artist_id, :instrument_id)
    end

    def find_play
        @play = Play.find(params[:id])
    end

end
