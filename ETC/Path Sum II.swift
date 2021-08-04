// 출처 : LeetCode Path Sum II
// https://leetcode.com/explore/challenge/card/august-leetcoding-challenge-2021/613/week-1-august-1st-august-7th/3838/
// 풀이 : hogumachu

class Solution {
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result: [[Int]] = []

        guard let root = root else { return result }
        visitNode(root, [root.val], root.val)

        func visitNode(_ node: TreeNode, _ arr: [Int], _ sum: Int) {
            if sum == targetSum && isLeaf(node) {
                result.append(arr)
            }
            if let left = node.left {
                visitNode(left, arr + [left.val], sum + left.val)
            }
            if let right = node.right {
                visitNode(right, arr + [right.val], sum + right.val)
            }
        }

        func isLeaf(_ node: TreeNode) -> Bool{
            if node.left == nil && node.right == nil {
                return true
            } else {
                return false
            }
        }

        return result
    }
}

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
