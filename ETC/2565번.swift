// 출처 : 백준 전깃줄
// https://www.acmicpc.net/problem/2565
// 풀이 : hogumachu

let n = Int(readLine()!)!

var values: [[Int]] = Array(repeating: [], count: n)
var dp = Array(repeating: 1, count: n)
for i in 0..<n {
    values[i].append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})
}
let sortedValues = values.sorted(by: {$0[0] < $1[0]}).map { $0[1] }

for i in 1..<n {
    for j in 0..<i {
        if sortedValues[i] > sortedValues[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(n - dp.max()!)
