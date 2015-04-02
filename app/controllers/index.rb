get '/' do
  erb :index
end

get '/signup/new' do
  erb :signup
end

post '/signup' do
  user = User.new(params[:user])

  if user.save
    session[:user_id] = user.id
    redirect '/itineraries/new'
  else
    @error = user.errors.full_messages.join(" ")
    erb :signup
  end
end

get '/session/new' do
  erb :session
end

post '/session' do
  user = User.find_by(email: params[:user][:email])

  if user.password == params[:user][:password]
    session[:user_id] = user.id
    redirect '/itineraries/new'
  else
    @error = "Invalid Email or Password"
    erb :session
  end
end

get '/itineraries/new' do
  erb :itinerary
end

post '/itineraries' do
  itinerary = Itinerary.new(params[:itinerary])
  if itinerary.save
    Invite.create(user_id: session[:user_id], itinerary_id: itinerary.id)
    redirect "/itineraries/#{itinerary.id}/destinations/new"
  else
    @error = "Itinerary could not be save"
    erb :itinerary
  end
end 

get "/itineraries/:id/destinations/new" do
  @itinerary_id = params[:id]
 
  @wineries = Yelp.client.search('Napa', { term: 'winery' })
  
  erb :destination

end

post '/itineraries/:id/destinations' do
  destination = Destination.new(
    itinerary_id: params[:id],
    name: params[:name],
    review_count: params[:review_count],
    image_url: params[:image_url],
    yelp_url: params[:yelp_url],
    address: params[:address]
  )
  destination.save
end










