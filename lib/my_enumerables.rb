module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in self do
      yield(i)
    end
    return self
  end

  def my_each_with_index
    index = 0

    for i in self do
      yield(i, index)
      index += 1
    end

    return self
  end

  def my_select
    arr = []

    for i in self do
      arr << i if yield(i)
    end

    return arr
  end

  def my_all?
    for i in self do
      return false unless yield(i)
    end

    return true
  end

  def my_any?
    for i in self do
      return true if yield(i)
    end

    return false
  end

  def my_none?
    for i in self do
      return false if yield(i)
    end

    return true
  end

  def my_count
    count = 0

    for i in self do
      if block_given?
        count += 1 if yield(i)
      else
        count += 1
      end
    end

    return count
  end

  def my_map
    arr = []

    for i in self do
      arr << yield(i)
    end

    return arr
  end

  def my_inject(initial_value)
    sum = initial_value

    for i in self do
      sum = yield(sum, i)
    end
    
    return sum
  end
end
