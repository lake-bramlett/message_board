require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a board path', {:type => :feature}) do
  it('creates an board and goes to the main index page') do
    visit('/')
    click_on('Add a Board')
    fill_in('name', :with => "Nick's Awesome Board")
    click_on('Enter')
    expect(page).to have_content("Nick's Awesome Board")
  end

  it('creates an board and goes to the main index') do
    visit('/')
    click_on('Add a Board')
    fill_in('name', :with => "Nick")
    fill_in('category', :with => "Sports")
    click_on('Enter')
    click_on("Nick")
    expect(page).to have_content("Category", "Sports")
  end
end
#
# describe('create a board path', {:type => :feature}) do
#   it('creates an board and goes to the main index page') do
#     visit('/')
#     click_on('Add a Board')
#     fill_in('category', :with => "Sports")
#     click_on('Enter')
#     expect(page).to have_content("Sports")
#   end
# end

# describe('create a post path', {:type => :feature}) do
#   it('creates a post and then goes to the board page') do
#     board = MessageBoard::Board.new(:name => "Frasier Fan Board", :category => "Televison")
#     @boards = MessageBoard::Board.all
#     board.create
#     visit("/board/#{board.id}")
#     fill_in('post_name', :with => 'All You Need Is Love')
#     click_on('Add post')
#     expect(page).to have_content('All You Need Is Love')
#   end
# end
