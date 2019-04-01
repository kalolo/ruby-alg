def linear_search(arr, key)
    (0..arr.length-1).each do |i|
        return i if arr[i] == key
    end
    -1
end

arr = [7,4,1,23,9,13,44,12,412,57]

p linear_search arr, 121