# Creates an error message if the quantities entered don't work
def error_message
  if params[:num_players].to_i * params[:num_cards].to_i > 52
    flash[:error] = "Those numbers don't work, please rethink your quantities"
    redirect '/'
  else
    session[:num_players] = params[:num_players]
    session[:num_cards] = params[:num_cards]
    redirect '/dealing'
  end
end
