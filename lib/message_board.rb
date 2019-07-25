module MessageBoard
  class Board
    attr_reader :id
    attr_accessor :name, :category

    @@boards = {}
    @@total_rows = 0

    def initialize(attributes)
      @name = attributes.fetch(:name)
      @category = attributes.fetch(:category)
      @id = id || @@total_rows += 1
    end

    def self.all
      @@boards.values()
    end

    def self.clear
      @@boards = {}
      @@total_rows = 0
    end

    def create
      @@boards[self.id] = self
    end

    def delete
      @@boards.delete(self.id)
    end

    def edit(name, category)
      self.name = name
      self.category = category
    end

    def self.find(id)
    @@boards[id]
    end

    def posts
      Post.find_by_board(self.id)
    end
  end

  class Post
    attr_reader :id, :author
    attr_accessor :date, :body, :board_id

    @@posts = {}
    @@total_rows = 0

    def initialize(attributes)
      @author = attributes.fetch(:author)
      @board_id = attributes.fetch(:board_id)
      @body = attributes.fetch(:body)
      @id = id || @@total_rows += 1
    end

    def self.all
      @@posts.values()
    end

    def board
      @@boards[self.id]
    end

    def create
      @@posts[self.id] = self
    end

    def delete
      @@posts.delete(self.id)
    end

    def edit(author, board_id, date, body)
      self.body = body
      self.board_id = board_id
    end

    def self.clear
      @@posts = {}
      @@total_rows = 0
    end

    def board
      Board.find(self.board_id)
    end

    def self.find_by_board(id)
    posts = []
    @@posts.values.each do |post|
      if post.board_id == id
        posts.push(post)
      end
    end
    posts
  end
  end
end
