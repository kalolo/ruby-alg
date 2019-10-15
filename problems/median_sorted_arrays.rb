=begin
4. Median of Two Sorted Arrays
There are two sorted arrays nums1 and nums2 of size m and n respectively.
Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
You may assume nums1 and nums2 cannot be both empty.

Example 1:
nums1 = [1, 3]
nums2 = [2]
The median is 2.0

Example 2:
nums1 = [1, 2]
nums2 = [3, 4]
The median is (2 + 3)/2 = 2.5

=end
require 'rspec/autorun'
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
    return 0 if nums1.empty? && nums2.empty?
    
    arr3 = merge_arrays nums1, nums2
    
    return arr3[0] if arr3.size == 1

    if (arr3.size.to_f % 2) == 0
        mid = ( arr3[ (arr3.size / 2 ) - 1] + arr3[arr3.size / 2]  ).to_f  / 2
    else
        mid = arr3[arr3.size / 2]
    end
    mid
end

def merge_arrays(arr1, arr2)
    arr3 = Array.new( arr1.size + arr2.size )
    i = 0
    j = 0
    x = 0
    while i < arr1.size && j < arr2.size
        if arr1[i] < arr2[j]
            arr3[x] = arr1[i]
            x+=1
            i+=1
        else
            arr3[x] = arr2[j]
            x+=1
            j+=1
        end        
    end

    while i < arr1.size
        arr3[x] = arr1[i]
        x+=1
        i+=1
    end 

    while j < arr2.size
        arr3[x] = arr2[j]
        x+=1
        j+=1
    end
    arr3
end

describe "Median of Two Sorted Arrays" do 
    it "find_median_sorted_arrays [1,3,4,6,7], [2,5] => 3" do
      expect( find_median_sorted_arrays [1,3,4,6,7], [2,5] ).to eql(4)
    end

    it "find_median_sorted_arrays [1,3,4,6,7], [2] => 1" do
      expect( find_median_sorted_arrays [1,3,4,6,7], [2] ).to eql(3.5)
    end

    it "find_median_sorted_arrays [1,3], [2] => 3" do
      expect( find_median_sorted_arrays [1,2], [3] ).to eql(2)
    end

    it "find_median_sorted_arrays [1,2], [3,4]" do
      expect( find_median_sorted_arrays [1,2], [3,4] ).to eql(2.5)
    end
end