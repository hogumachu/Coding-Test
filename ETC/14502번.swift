// 출처 : 백준 연구소
// https://www.acmicpc.net/problem/14502
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var table: [[Int]] = Array(repeating: [], count: n)
    var wall: [(Int, Int)] = []
    var virus: [(Int, Int)] = []
    var safeZone: [(Int, Int)] = []
    var result = 0
    for i in 0..<n {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 0..<m {
            if table[i][j] == 1 {
                wall.append((i, j))
            } else if table[i][j] == 2 {
                virus.append((i, j))
            } else {
                safeZone.append((i, j))
            }
        }
    }


    func visit(_ newWall: [(Int, Int)]) -> Void {
        var queue = virus
        var queueIndex = 0

        func spread(_ x: Int, _ y: Int) -> Void {
            if x-1 >= 0 {
                if !queue.contains(where: {$0.0 == x-1 && $0.1 == y}) && !newWall.contains(where: {$0.0 == x-1 && $0.1 == y}) {
                    queue.append((x-1, y))
                }
            }
            if x+1 < n {
                if !queue.contains(where: {$0.0 == x+1 && $0.1 == y}) && !newWall.contains(where: {$0.0 == x+1 && $0.1 == y}) {
                    queue.append((x+1, y))
                }
            }
            if y-1 >= 0 {
                if !queue.contains(where: {$0.0 == x && $0.1 == y-1}) && !newWall.contains(where: {$0.0 == x && $0.1 == y-1}) {
                    queue.append((x, y-1))
                }
            }
            if y+1 < m {
                if !queue.contains(where: {$0.0 == x && $0.1 == y+1}) && !newWall.contains(where: {$0.0 == x && $0.1 == y+1}) {
                    queue.append((x, y+1))
                }
            }
        }

        while queue.count > queueIndex {
            let select = queue[queueIndex]
            queueIndex += 1
            spread(select.0, select.1)
            if result > n*m - queue.count - wall.count - 3 {
                break
            }
        }
        if result < n*m - queue.count - wall.count - 3 {
            result = n*m - queue.count - wall.count - 3
        }
    }
    for i in 0..<safeZone.count-2 {
        for j in i+1..<safeZone.count-1 {
            for k in j+1..<safeZone.count {
                visit(wall + [safeZone[i], safeZone[j], safeZone[k]])
            }
        }
    }
    print(result)
}

solution()
