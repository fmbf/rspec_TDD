def remove_dups(arr)
  answer = []
  arr.each { |el| answer << el unless answer.include?(el) }
  answer
end

def two_sum(arr)
  answer = []
  arr.length.times do |id|
    id2 = id + 1

    while id2 < arr.length
      answer << [id, id2] if arr[id] + arr[id2] == 0
      id2 += 1
    end

  end

  answer
end

def my_transpose(arr)
  answer = Array.new(3) { Array.new(arr.length) }

  arr.each_with_index do |row, i1|
    row.each_with_index do |el, i2|

      answer[i2][i1] = el

    end
  end

  answer
end

def stock_picker(arr)
  answer = []
  diff = 0
  arr.each_with_index do |day, id|
    j = id + 1
    while j < arr.length
      if arr[j] - arr[id] > diff
        diff = arr[j] - arr[id]
        answer = [id, j]
      end
      j += 1
    end
  end
  answer
end

class TowersofHanoi
  attr_reader :towers

  def initialize
    @towers = [[3, 2, 1], [], []]
  end

  def move(source, destination)
    raise "ILLEGAL!" if @towers[source].empty?

    if !@towers[destination].last.nil? && (@towers[source].last > @towers[destination].last)
      raise "Can't do this!"
    end

    raise "Can't move to same spot!" if source == destination


    @towers[destination] << @towers[source].pop

  end



end
