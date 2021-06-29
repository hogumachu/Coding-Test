// 출처 : 백준 내려가기
// https://www.acmicpc.net/problem/2096
// 풀이 : hogumachu

let n = Int(readLine()!)!
var maxDp = Array(repeating: Array(repeating: 0, count: 3), count: n)
var minDp = Array(repeating: Array(repeating: 0, count: 3), count: n)
let first = readLine()!.split(separator: " ").map{Int(String($0))!}
maxDp[0][0] = first[0]
maxDp[0][1] = first[1]
maxDp[0][2] = first[2]
minDp[0][0] = first[0]
minDp[0][1] = first[1]
minDp[0][2] = first[2]

for i in 1..<n {
    let value = readLine()!.split(separator: " ").map{Int(String($0))!}
    maxDp[i][0] = max(maxDp[i-1][0], maxDp[i-1][1]) + value[0]
    maxDp[i][1] = max(maxDp[i-1][0], maxDp[i-1][1], maxDp[i-1][2]) + value[1]
    maxDp[i][2] = max(maxDp[i-1][1], maxDp[i-1][2]) + value[2]

    minDp[i][0] = min(minDp[i-1][0], minDp[i-1][1]) + value[0]
    minDp[i][1] = min(minDp[i-1][0], minDp[i-1][1], minDp[i-1][2]) + value[1]
    minDp[i][2] = min(minDp[i-1][1], minDp[i-1][2]) + value[2]
}
print(maxDp[n-1].max()!, minDp[n-1].min()!)
