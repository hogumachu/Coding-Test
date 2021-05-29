// 출처 : 백준 회장뽑기
// https://www.acmicpc.net/problem/2660
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: Array(repeating: 10000, count: n+1), count: n+1)
    var queue: [(Int, Int)] = []
    var friendCount = Array(repeating: 1, count: n+1)
    var queueIndex = 0
    while true {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        if value[0] == -1 {
            break
        }
        table[value[0]][value[1]] = 1
        table[value[1]][value[0]] = 1
        queue.append((value[0], value[1]))
        queue.append((value[1], value[0]))
    }
    func visit(_ x: Int, _ y:Int) -> Void {
        for i in 0..<n {
            if x == i {
                continue
            }else if table[y][i] != 10000 && table[x][i] > table[x][y] + table[y][i] {
                table[x][i] = table[x][y] + table[y][i]
                table[i][x] = table[x][y] + table[y][i]
                queue.append((x,i))
            }
        }
    }
    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        visit(select.0, select.1)
    }
    for i in 1...n {
        for j in 1...n {
            if i != j {
                if friendCount[i] < table[i][j] {
                    friendCount[i] = table[i][j]
                }
            }
        }
    }
    let president = friendCount[1...n].min()!
    var result = ""
    var count = 0
    for i in 1...n {
        if friendCount[i] == president {
            result += "\(i) "
            count += 1
        }
    }
    print("\(president) \(count)")
    print(result)

}

solution()
