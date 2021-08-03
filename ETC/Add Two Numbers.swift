// 출처 : LeetCode Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/
// 풀이 : hogumachu

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var nodeArray: [ListNode] = []
        var index = 0

        var first = l1
        var second = l2
        var now = 0

        while true {
            if first != nil && second != nil {
                nodeArray.append(ListNode.init((first!.val + second!.val + now) % 10))
                now = (first!.val + second!.val + now) / 10
                first = first!.next
                second = second!.next
            } else if first == nil && second != nil {
                nodeArray.append(ListNode.init((second!.val + now) % 10))
                now = (second!.val + now) / 10
                second = second!.next
            } else if first != nil && second == nil {
                nodeArray.append(ListNode.init((first!.val + now) % 10))
                now = (first!.val + now) / 10
                first = first!.next
            } else if now != 0{
                nodeArray.append(ListNode.init(now))
                now = 0
            } else {
                break
            }
        }

        for i in 0..<nodeArray.count - 1 {
            nodeArray[i].next = nodeArray[i + 1]
        }

        return nodeArray[0]
    }
}
