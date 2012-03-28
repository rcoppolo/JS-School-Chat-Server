class MessagesController < ApplicationController


  def index
		if params[:text]
			Message.create! :text => params[:text], :author => params[:author]
			render :text => "#{params[:callback]}({status:'success'});"
		else
			@messages = Message.where "created_at > ?", Time.at(params[:after].to_i / 1000)
			render :text => "#{params[:callback]}(#{@messages.to_json});"
		end
  end

  def create
    Message.create! :text => params[:text], :author => params[:author]
    render :text => "#{params[:callback]}({status:'success'});"
  end
end
