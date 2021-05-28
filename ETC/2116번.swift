// 출처 : 백준 주사위 찾기
// https://www.acmicpc.net/problem/2116
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: [], count: n)
    // 0-5, 1-3, 2-4
    var top = 0
    var down = 0
    var nextTopIndex = 0
    var nextDownIndex = 0
    var result = 0
    for i in 0..<n {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    func topDown(_ num: Int) -> Int {
        if num == 0 {
            return 5
        } else if num == 1 {
            return 3
        } else if num == 2 {
            return 4
        } else if num == 3 {
            return 1
        } else if num == 4 {
            return 2
        } else {
            return 0
        }
    }

    for i in 0..<6 {
        var compare = 0
        top = table[0][i]
        down = table[0][topDown(i)]
        for j in 0..<n {
            var max = 0
            for k in 0..<6 {
                if table[j][k] == top {
                    nextDownIndex = k
                    nextTopIndex = topDown(k)
                    top = table[j][nextTopIndex]
                    down = table[j][nextDownIndex]
                    break
                }
            }
            for k in 0..<6 {
                if table[j][k] != top && table[j][k] != down, table[j][k] > max {
                    max = table[j][k]
                }
            }
            compare += max

        }
        if result < compare {
            result = compare
        }
    }
    print(result)
}

solution()
