=begin
Given an array of integers, return indices of the two numbers such that they add up to a specific target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].
=end
require 'rspec/autorun'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    
    data = {}
    return [] if nums.empty?
    
    nums.each.with_index do |n,x|
        return [data[n], x] if x != data[n] && data[n] 
        data[target - n] = x
    end
    return []
end

describe "Given an array of integers, return indices of the two numbers such that they add up to a specific target." do 
    it "two_sum [2,7,11,15], 9 => [0,1]" do
        expect( two_sum [2,7,11,15], 9 ).to eql([0,1])
    end

    it "two_sum [3,2,4], 6 => [1,2]" do
        expect( two_sum [3,2,4], 6 ).to eql([1,2])
    end

    it "two_sum [3,3], 6 => [0,1]" do
        expect( two_sum [3,3], 6 ).to eql([0,1])
    end

    it "two_sum [], 9 => []" do
        expect( two_sum [], 6 ).to eql([])
    end
end