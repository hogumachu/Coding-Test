// 출처 : LeetCode Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/
// 풀이 : hogumachu

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
                let charArr = Array(s)
        var alpha = Array(repeating: 0, count: 127)
        let newAlpha = Array(repeating: 0, count: 127)
        var result = 0
        var now = 0
        var index = 0


        while index < charArr.count {
            let num = Int(charArr[index].asciiValue!)
            if alpha[num] != 0 {
                index = alpha[num]
                result = max(result, now)
                now = 0
                alpha = newAlpha
            } else {
                alpha[num] = index + 1
                now += 1
                index += 1
            }
        }
        return max(result, now)
    }
}
