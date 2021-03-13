// 출처 : 백준 유기농 배추
// https://www.acmicpc.net/problem/1012
// 풀이 : hogumachu
// 탐색 문제인듯
// 위치에 값이 1인 곳에 방문
// 그 위치에 방문을 하면 false를 true로 변경
// 만약 true이면 방문하지 않음 (이미 방문 했으므로)

import Foundation

let T = Int(readLine()!)!

var sol: [Int] = []
for _ in 0..<T {
    let read = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = read[0], n = read[1], k = read[2] // 가로 x 세로 : m x n // 배추 수 : k
    var cabbage: [[(Int, Bool)]] = Array(repeating: Array(repeating: (0, false), count: m), count: n)
    var result = 0
    var haveCabbage: [(Int, Int)] = []
    for _ in 0..<k {
        let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
        cabbage[temp[1]][temp[0]] = (1, false)
        haveCabbage.append((temp[1], temp[0]))
    }

    func warm( _ x: Int, _ y: Int) -> Void {
        cabbage[x][y].1 = true
        if x-1 >= 0, cabbage[x-1][y] == (1, false) {
            warm(x-1, y)
        }
        if x+1 < n, cabbage[x+1][y] == (1, false) {
            warm(x+1, y)
        }
        if y-1 >= 0, cabbage[x][y-1] == (1, false) {
            warm(x, y-1)
        }
        if y+1 < m, cabbage[x][y+1] == (1, false) {
            warm(x, y+1)
        }

    }

    for i in haveCabbage {
        if cabbage[i.0][i.1] == (1, false) {
            warm(i.0, i.1)
            result += 1
        } else {
            continue
        }
    }

    sol.append(result)
}

for sol in sol {
    print(sol)
}
