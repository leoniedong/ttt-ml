class Board
    require 'pry'
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset! # the exclamation mark means forcing something to happen
        @cells = Array.new(9, " ") # arrays with 9 cells, each with " "
    end

    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "-----------"
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "-----------"        
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
        cells[input.to_i-1]
    end

    def full? #? means return either true or false
        cells.all?{|character| character == "X" || character == "O"} #check if all array positions satisfy the condition
    end

    def turn_count
        cells.count {|char| char == "X" || char == "O"}
    end

    def taken?(input)
        (cells[input.to_i-1] == "X" || cells[input.to_i-1] == "O") ? true : false
    end

    def valid_move?(input)
        (input.to_i.between?(1,9) && !taken?(input)) ? true : false
    end

    def update(input, player)
        cells[input.to_i-1] = player.token
    end



    private

end
