get '/' do
  login_required
  @goals = Goal.all
  # View
  haml :index
end

post '/goals' do
  @data = params[:goal]
  @data["dm_user_id"] = current_user.id
  Goal.create(@data)
  redirect to('/')
end