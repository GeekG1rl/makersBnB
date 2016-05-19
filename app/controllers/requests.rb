class MakersBnB < Sinatra::Base

  post '/requests' do
    space_id = params[:space_id]
    user_id = current_user.id
    Request.first_or_create(user_id: user_id,
                            space_id: space_id) unless own_space? space_id
    redirect '/spaces'
  end

  get '/requests' do
    @requests_made = Request.all(user_id: current_user.id)
    # @requests_received = Request.all(space_id: Space.first(user_id: current_user.id).id)
    erb :'requests/index'
  end

end