# your code goes here
require "pry"

def begins_with_r(array)
  for i in (0...array.length)
    return false if !(array[i].start_with?("r"))
  end
  true
end

def contain_a(array)
  newarray = []
  for i in (0...array.length)
    newarray << array[i] if array[i].include?("a")
  end
  newarray
end

def first_wa(array)
  array.find {|el| el.start_with?("wa") if el.is_a?(String)}
end

def remove_non_strings(array)
  array.delete_if {|el| !(el.is_a?(String))}
end

def count_elements(array)
  newarray = []
  array.group_by {|hash| hash}.each do |key, value|
    to_be_merged = {:count => value.length}
    newkey = {}
    newkey = key.merge(to_be_merged)
    newarray << newkey
  end
  newarray
end
    
def merge_data(keys, data)
  grouped = keys.group_by {|hash| hash[:first_name]}
  grouped.each do |key, val|
    grouped[key] = val[0]
  end
  data.each do |element|
    element.merge!(grouped) do |key, elval, grval|
      elval.merge!(grval)
    end
  end 
  data.collect {|element| element.values}.flatten
end 

def find_cool(array)
  newarray = []
  array.each do |element|
    element.each do |key, val|
      if val == "cool"
        newarray << element
      end
    end
  end
  newarray
end 

def organize_schools(schools)
  grouped = schools.group_by {|key, val| val[:location]}
  grouped.each do |city, schools|
    schools.each do |school|
      school.delete_if {|el| el.is_a?(Hash)}
    end
    schools.flatten!
  end
  grouped
end

