require 'rspec/autorun'
=begin
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. 
Add the two numbers and return it as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

Example:

Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
Output: 7 -> 0 -> 8
Explanation: 342 + 465 = 807.
=end

# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val)
#         @val = val
#         @next = nil
#     end
# end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)

    result = join_linked_list(l1) + join_linked_list(l2)
    list = number_to_reverse_list result.to_s.reverse.split('')
    list.first
end

def join_linked_list(list)
    data = ""
    current = list
    while (current) do
        data += current.val.to_s
        current = current.next
    end
    data.reverse.to_i
end

def number_to_reverse_list(number)
    list = LinkedList.new
    number.each do |c|
        list.add_value c
    end
    list
end

class LinkedList
    attr_accessor :head, :first

    def initialize
        @head = nil
    end

    def add_with_array(arr)
        arr.each do |x|
            add_value x
        end
        @first
    end

    def add_value(val)
        node = ListNode.new val.to_i
        if !@head 
            @head = node
            @first = node
            return @head
        end
        
        @head.next = node
        @head = node
    end

    def current
        return @head if @head
    end

    def first
        return @first if @first
    end
end

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

#l1 = ListNode.new(2)
#l2 = ListNode.new(4)
#l3 = ListNode.new(3)
#l1.next = l2
#l2.next = l3

#l4 = ListNode.new(5)
#l5 = ListNode.new(6)
#l6 = ListNode.new(4)

#l4.next = l5
#l5.next = l6
#p add_two_numbers l1, l4

describe "You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. " do 
    it "Add the two numbers and return it as a linked list.
        Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
        Output: 7 -> 0 -> 8" do

        list = LinkedList.new
        list.add_value 7
        list.add_value 0
        list.add_value 8

        list1 = LinkedList.new.add_with_array [2,4,3]
        list2 = LinkedList.new.add_with_array [5,6,4]

        expect( join_linked_list(add_two_numbers(list1, list2)) ).to eql( join_linked_list(list.first) )
    end
end