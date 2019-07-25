require('sinatra')
require('sinatra/reloader')
require('./lib/message_board')
require('pry')
also_reload('lib/**/*.rb')

get ('/') do
  @boards = MessageBoard::Board.all
  erb(:index)
end

get ('/boards/new') do
  erb(:board_new)
end

get ('/boards/:id') do
  @board = MessageBoard::Board.find(params[:id].to_i())
  erb(:board)
end

get ('/boards/:id/edit') do
  @board = MessageBoard::Board.find(params[:id].to_i())
  erb(:edit_board)
end

patch ('/boards/:id') do
  @board = MessageBoard::Board.find(params[:id].to_i())
  @board.edit(params[:name],params[:category])
  erb(:board)
end

post ('/') do
  name = params[:name]
  category = params[:category]
  board = MessageBoard::Board.new({:name => name, :category => category})
  board.create
  @boards = MessageBoard::Board.all
  erb(:index)
end

post ('/boards/:id/posts') do
  @board = MessageBoard::Board.find(params[:id].to_i())
  post = MessageBoard::Post.new({:author => params[:author], :body => params[:body], :board_id => @board.id})
  post.create
  redirect to("/boards/#{params[:id]}")
  erb(:board)
end

delete ('/boards/:id') do
  @board = MessageBoard::Board.find(params[:id].to_i())
  @board.delete()
  @boards = MessageBoard::Board.all
  redirect to('/')
  erb(:index)
end
