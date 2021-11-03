// 출처 : 백준 합분해
// https://www.acmicpc.net/problem/2225
// 풀이 : hogumachu

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nk[0], k = nk[1]
var saveValue: [[Int]] = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
var hasValue: [[Bool]] = Array(repeating: Array(repeating: false, count: k + 1), count: n + 1)

func solution(_ n: Int, _ k: Int) -> Int {
    if n == 0 {
        saveValue[n][k] = 1
        hasValue[n][k] = true
        return 1
    } else {
        if k == 1 {
            saveValue[n][k] = 1
            hasValue[n][k] = true
            return 1
        } else if k == 2 {
            saveValue[n][k] = n + 1
            hasValue[n][k] = true
            return n + 1
        } else {
            var sum = 0
            for i in 0...n {
                if hasValue[i][k - 1] {
                    sum += saveValue[i][k - 1]  % 1_000_000_000
                } else {
                    sum += solution(i, k - 1)  % 1_000_000_000
                }
            }
            saveValue[n][k] = sum % 1_000_000_000
            hasValue[n][k] = true
            return sum % 1_000_000_000
        }
    }
}


print(solution(n, k))
