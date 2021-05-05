// 출처 : 백준 파도반 수열
// https://www.acmicpc.net/problem/9461
// 풀이 : hogumachu
// 규칙을 찾으면 쉽게 풀리는 문제

import Foundation

func solution() {
    let T = Int(readLine()!)!
    var P: [Int] = [0]

    P.append(1) // P[1] = 1
    P.append(1) // P[2] = 1
    P.append(1) // P[3] = 1

    for _ in 0..<T {
        let n = Int(readLine()!)!
        if n < P.count {
            print(P[n])
        } else {
            for i in P.count...n {
                P.append(P[i-3] + P[i-2])
            }
            print(P[n])
        }
    }
}

solution()
