# frozen_string_literal: true

# Standard enumerables
module Enumerable
  def my_each_with_index
    index = 0
    my_each do |value|
      yield [value, index]
      index += 1
    end
  end

  def my_any?
    my_each do |value|
      return true if yield(value) == true
    end
    false
  end

  def my_none?
    my_each do |value|
      return false if yield(value) == true
    end
    true
  end

  def my_all?
    my_each do |value|
      return false if yield(value) == false
    end
    true
  end

  def my_select
    selected = []
    my_each do |value|
      selected << value if yield(value) == true
    end
    selected
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |value|
      count += 1 if yield(value) == true
    end
    count
  end

  def my_map
    mapped = []
    my_each do |value|
      mapped << yield(value)
    end
    mapped
  end

  def my_inject(acc)
    i = 0
    while i < length
      acc = yield *acc, self[i]
      i += 1
    end
    acc
  end
end

# base enumerable used for methods in Enumerable
class Array
  def my_each
    i = 0
    while i < length
      yield self[i]
      i += 1
    end
    self
  end
end
