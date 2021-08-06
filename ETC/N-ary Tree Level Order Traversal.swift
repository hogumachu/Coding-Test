// 출처 : LeetCode N-ary Tree Level Order Traversal
// https://leetcode.com/explore/challenge/card/august-leetcoding-challenge-2021/613/week-1-august-1st-august-7th/3871/
// 풀이 : hogumachu

/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var children: [Node]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.children = []
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: Node?) -> [[Int]] {
        var queue: [(Node, Int)] = []
        var queueCount = 0
        var result: [[Int]] = []

        if root != nil {
            queue.append((root!, 0))
        }



        while queueCount < queue.count {
            if result.count == queue[queueCount].1 {
                result.append([queue[queueCount].0.val])
            } else {
                result[queue[queueCount].1].append(queue[queueCount].0.val)
            }
            queue[queueCount].0.children.forEach { node in
                if node != nil {
                    queue.append((node, queue[queueCount].1 + 1))
                }

            }
            queueCount += 1
        }

        return result
    }
}
