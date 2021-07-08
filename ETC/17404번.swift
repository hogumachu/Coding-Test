// 출처 : 백준 RGB거리 2
// https://www.acmicpc.net/problem/17404
// 풀이 : hogumachu

let n = Int(readLine()!)!
var values: [[Int]] = Array(repeating: [], count: n)
let first = readLine()!.split(separator: " ").map{Int(String($0))!}
let maxNum = 1_000 * 1_001
var result = maxNum
values[0] = first
(1..<n).forEach({
    values[$0].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
})
(0...2).forEach({
    result = result > getValue($0) ? getValue($0) : result
})
print(result)

func getValue(_ num: Int) -> Int {
    var dp = Array(repeating: [0, 0, 0], count: n + 1)
    values[0] = [maxNum, maxNum, maxNum]
    values[0][num] = first[num]

    for i in 1...n {
        dp[i][0] = values[i - 1][0] + min(dp[i-1][1], dp[i-1][2])
        dp[i][1] = values[i - 1][1] + min(dp[i-1][0], dp[i-1][2])
        dp[i][2] = values[i - 1][2] + min(dp[i-1][0], dp[i-1][1])
    }

    switch num {
    case 0:
        return min(dp[n][1], dp[n][2])
    case 1:
        return min(dp[n][0], dp[n][2])
    case 2:
        return min(dp[n][0], dp[n][1])
    default:
        return maxNum
    }
}
