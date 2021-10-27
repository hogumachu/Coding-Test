// 출처 : 백준 1, 2, 3 더하기 3
// https://www.acmicpc.net/problem/15988
// 풀이 : hogumachu

var arr: [Int] = Array(repeating: 0, count: 1_000_001)
var complete = 4
let div = 1_000_000_009

arr[1] = 1
arr[2] = 2
arr[3] = 4

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!

    if n >= complete {
        for i in complete...n {
            arr[i] = ((arr[i - 1] % div) + (arr[i - 2] % div) + (arr[i - 3] % div)) % div
        }
        complete = n
    }

    print(arr[n])
}
