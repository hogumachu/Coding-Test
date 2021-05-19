// 출처 : 백준 신나는 함수 실행
// https://www.acmicpc.net/problem/9184
// 풀이 : hogumachu

import Foundation

func solution() {
    var dp: [[[Int]]] = Array(repeating: Array(repeating: Array(repeating: 0, count: 21), count: 21), count: 21)
    dp[0][0][0] = 1
    func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
        if a <= 0 || b <= 0 || c <= 0 {
            return 1
        } else if a > 20 || b > 20 || c > 20 {
            return w(20, 20, 20)
        } else if a < b && b < c {
            if dp[a][b][c] == 0 {
                dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
            }
            return dp[a][b][c]
        } else {
            if dp[a][b][c] == 0 {
                dp[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
            }
            return dp[a][b][c]
        }
    }

    for i in 1...20 {
        for j in 1...20 {
            for k in 1...20 {
                dp[i][j][k] = w(i, j, k)
            }
        }
    }
    while true {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let a = input[0], b = input[1], c = input[2]
        if a == -1 && b == -1 && c == -1 {
            break
        } else {
            print("w(\(a), \(b), \(c)) = \(w(a, b, c))")
        }
    }
}

solution()
