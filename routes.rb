get '/' do
  login_required
  @goals = Goal.all
  haml :index
end

get '/goals' do
  redirect to('/')
end

post '/goals' do
  @data = params[:goal]
  @data["dm_user_id"] = current_user.id
  Goal.create(@data)
  redirect to('/')
end

post 'goals/:id' do
  params[:id]
  redirect to('/')
end

get '/goals/:id' do
  login_required
  if current_user.id == Goal.get(params[:id]).dm_user_id
    @goals = Goal.all
    @specific_goal = Goal.get(params[:id])
    haml :goal
  else
    redirect to('/')
  end
end

post '/goals/completed/:id' do
  Goal.get(params[:id]).worked_on == true
  "Goal completed!"
end

delete '/goals/delete/:id' do
  Goal.get(params[:id]).destroy
  "Goal destroyed!"
end
