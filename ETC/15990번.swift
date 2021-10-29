// 출처 : 백준 1, 2, 3 더하기 5
// https://www.acmicpc.net/problem/15990
// 풀이 : hogumachu

var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: 4), count: 100_001)
var complete = 3
let DIV = 1_000_000_009

arr[1][1] = 1
arr[2][2] = 1
arr[3][1] = 1
arr[3][2] = 1
arr[3][3] = 1

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!

    if n > complete {
        for i in complete + 1 ... n {
            arr[i][1] = (arr[i - 1][2] % DIV + arr[i - 1][3] % DIV) % DIV
            arr[i][2] = (arr[i - 2][1] % DIV + arr[i - 2][3] % DIV) % DIV
            arr[i][3] = (arr[i - 3][1] % DIV + arr[i - 3][2] % DIV) % DIV
        }
        complete = n
    }

    print((arr[n][1] + arr[n][2] + arr[n][3]) % DIV)
}
