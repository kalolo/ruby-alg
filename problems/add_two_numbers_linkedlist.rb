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
    list.head
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
    #list = LinkedList.new
    list = nil
    number.each do |c|
        if list == nil then
            list = LinkedList.new c.to_i
        else
            list.add_value c.to_i
        end
    end
    list
end

class LinkedList
    attr_accessor :head

    def initialize(value)
        @head = ListNode.new value
    end

    def self.add_with_array(arr)
        list = nil
        arr.each do |x|
            if !list then
                list = LinkedList.new x
            else
                list.add_value x
            end
        end
        list
    end

    def add_value(val)
        current_node = @head
        while current_node.next != nil
            current_node = current_node.next
        end
        current_node.next = ListNode.new val
    end
end

class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

describe "You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. " do 
    it "Add the two numbers and return it as a linked list.
        Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
        Output: 7 -> 0 -> 8" do

        list1 = LinkedList.add_with_array [2,4,3]
        list2 = LinkedList.add_with_array [5,6,4]

        expect( 
            join_linked_list(
                add_two_numbers(list1.head, list2.head)
            ) 
        ).to eql( 
            join_linked_list(LinkedList.add_with_array([7,0,8]).head)
        )
    end
end