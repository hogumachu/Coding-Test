// 출처 : 백준 영식이와 친구들
// https://www.acmicpc.net/problem/1592
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1], l = input[2]
    var table: [Int] = Array(repeating: 0, count: n+1)
    var now = 1
    var count = 0
    table[now] = 1

    while table[now] != m {
        if table[now] % 2 == 0 {
            if now - l <= 0 {
                now = now - l + n
            } else {
                now = now - l
            }
            table[now] += 1
        } else {
            if now + l > n {
                now = now + l - n
            } else {
                now = now + l
            }
            table[now] += 1
        }
        count += 1
    }
    print(count)
}

solution()
