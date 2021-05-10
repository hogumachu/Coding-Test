// 출처 : 백준 미로 탐색
// https://www.acmicpc.net/problem/2178
// 풀이 : hogumachu


import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var table: [[Int]] = Array(repeating: [], count: n)
    var road: [[Int]] = Array(repeating: Array(repeating: n*m, count: m), count: n)
    var queue: [(Int, Int)] = []
    for i in 0..<n {
        table[i] = readLine()!.map{Int(String($0))!}
    }
    road[0][0] = 1

    func visit(_ x: Int, _ y: Int) -> Void {
        if x-1 >= 0 {
            if table[x-1][y] != 0 && road[x-1][y] > road[x][y] + 1 {
                road[x-1][y] = road[x][y] + 1
                queue.append((x-1,y))
            }
        }
        if x+1 < n {
            if table[x+1][y] != 0 && road[x+1][y] > road[x][y] + 1 {
                road[x+1][y] = road[x][y] + 1
                queue.append((x+1,y))
            }
        }
        if y-1 >= 0 {
            if table[x][y-1] != 0 && road[x][y-1] > road[x][y] + 1 {
                road[x][y-1] = road[x][y] + 1
                queue.append((x,y-1))
            }
        }
        if y+1 < m {
            if table[x][y+1] != 0 && road[x][y+1] > road[x][y] + 1 {
                road[x][y+1] = road[x][y] + 1
                queue.append((x,y+1))
            }
        }
    }
    queue.append((0,0))
    while queue.count != 0 {
        let dequeue = queue.removeFirst()
        visit(dequeue.0, dequeue.1)
    }

    print(road[n-1][m-1])

}

solution()
