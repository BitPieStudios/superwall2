# Note: the name of this file (app.rb) is irrelevant.

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

get '/' do
  posts = Post.reverse_order(:created_at).all
  erb :index, :locals => {:posts => posts}
end

post '/posts' do

	if !params[:body].empty?
		Post.create(:body => params[:body])
 		redirect to('/')
	else
		redirect to('/')
	end
end
post '/posts/:id/upvote' do
	post = Post.where(:id => params[:id]).first
	post.votes += 1
	post.save

	redirect to('/')
end
post '/posts/:id/downvote' do
	post = Post.where(:id => params[:id]).first
	post.votes -= 1
	post.save

	redirect to('/')
end
post '/posts/:id/delii' do
	post = Post.where(:id => params[:id]).first
	post.delete

	redirect to('/')
end
get '/todo' do
  erb :todo
end
