require('rspec')
require('message_board')

describe '#Board' do

  before(:each) do
    MessageBoard::Board.clear()
  end

  describe('.create') do
    it("creates a new board") do
      test_board = MessageBoard::Board.new(:name => "Frasier Fan Board", :category => "Televison")
      test_board.create
      @boards = MessageBoard::Board.all
      expect(@boards).to(eq([test_board]))
    end
  end

  describe('.delete') do
    it("deletes a board") do
      test_board = MessageBoard::Board.new(:name => "Frasier Fan Board", :category => "Televison")
      test_board.create
      test_board.delete
      @boards = MessageBoard::Board.all
      expect(@boards).to(eq([]))
    end
  end

  describe('.edit') do
    it("edits a board information") do
      test_board = MessageBoard::Board.new(:name => "Frasier Fan Board", :category => "Televison")
      test_board.edit("Fraise-Board", "Televison")
      expect(test_board.name).to(eq("Fraise-Board"))
    end
  end
end

describe '#Post' do
  before(:each) do
    MessageBoard::Post.clear()
  end

  describe('.create') do
    it("creates a new post in a board") do
      test_post = MessageBoard::Post.new({:author => "FrazierFan89", :board_id => "2", :date => "25/07/2019 08:56", :body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
      test_post.create
      @posts = MessageBoard::Post.all
      expect(@posts).to(eq([test_post]))
    end
  end

  describe('.delete') do
    it("deletes a post in a board") do
      test_post = MessageBoard::Post.new({:author => "FrazierFan89", :board_id => "2", :date => "25/07/2019 08:56", :body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
      test_post.create
      test_post.delete
      @posts = MessageBoard::Post.all
      expect(@posts).to(eq([]))
    end
  end

  describe('.edit') do
    it("edits a post in a board") do
      test_post = MessageBoard::Post.new({:author => "FrazierFan89", :board_id => "2", :date => "25/07/2019 08:56", :body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."})
      test_post.create
      test_post.edit("FrazierFan89", nil, "25/07/2019 08:56", "Frasier is the best!")
      expect(test_post.body).to(eq("Frasier is the best!"))
    end
  end
end
