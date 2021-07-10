// 출처 : 백준 가장 긴 바이토닉 부분 수열
// https://www.acmicpc.net/problem/11054
// 풀이 : hogumachu

let n  = Int(readLine()!)!
let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var upTable: [Int] = Array(repeating: 1, count: n)
var downTable: [Int] = Array(repeating: 1, count: n)
var result = 1
for i in 0..<values.count {
    for j in 0..<i {
        values[i] > values[j] ? (upTable[i] = max(upTable[i], upTable[j] + 1)) : nil
        values[n - i - 1] > values[n - j - 1] ? (downTable[n - i - 1] = max(downTable[n - i - 1], downTable[n - j - 1] + 1)) : nil
    }
}
for i in 0..<n {
    result = result < upTable[i] + downTable[i] - 1 ? upTable[i] + downTable[i] - 1: result
}
print(result)
