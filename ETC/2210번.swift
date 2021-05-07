// 출처 : 백준 숫자판 점프
// https://www.acmicpc.net/problem/2210
// 풀이 : hogumachu

import Foundation

func solution() {
    var table: [[Int]] = []
    var result: Set<String> = []
    for _ in 0..<5 {
        table.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }

    func jump(_ x: Int, _ y: Int, _ sequence: String) -> Void {
        var value = ""
        if sequence.count < 5 {
            value = sequence + "\(table[x][y])"
            if x+1 < 5 {
                jump(x+1, y, value)
            }
            if x-1 >= 0 {
                jump(x-1, y, value)
            }
            if y+1 < 5 {
                jump(x, y+1, value)
            }
            if y-1 >= 0 {
                jump(x, y-1, value)
            }
        } else if sequence.count == 5 {
            value = sequence + "\(table[x][y])"
            result.insert("\(value)")
        }
    }

    for i in 0..<5 {
        for j in 0..<5 {
            jump(i, j, "")
        }
    }
    print(result.count)
}

solution()
