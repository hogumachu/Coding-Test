// 출처 : LeetCode Plus One
// https://leetcode.com/problems/plus-one/submissions/
// 풀이 : hogumachu

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result: [Int] = []
        var now = 0
        var varDigits = digits
        let first = varDigits.removeLast() + 1

        now = first / 10
        result.append(first % 10)

        while !varDigits.isEmpty {
            let num = varDigits.removeLast()
            result.append((num + now) % 10)
            now = (num + now) / 10
        }

        if now != 0 {
            result.append(now)
        }

        result.reverse()

        return result
    }
}
