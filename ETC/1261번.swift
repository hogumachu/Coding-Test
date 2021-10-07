// 출처 : 백준 알고스팟
// https://www.acmicpc.net/problem/1261
// 풀이 : hogumachu

let size = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var maze: [[Int]] = Array(repeating: [], count: size[1])
var weights: [[Int]] = Array(repeating: Array(repeating: size[0] + size[1] - 2, count: size[0]), count: size[1])
var queue: [(x: Int, y: Int, weight: Int)] = []
var queueIndex = 0

for i in 0..<size[1] {
    let row = readLine()!.map { Int(String($0))! }
    maze[i] = row
}

queue.append((0, 0, 0))

while queueIndex < queue.count {
    let now = queue[queueIndex]
    queueIndex += 1

    if now.weight < weights[now.x][now.y] {
        weights[now.x][now.y] = now.weight
        visit(now.x, now.y, now.weight)
    }
}

func visit(_ x: Int, _ y: Int, _ weight: Int) {
    let moves: [(x: Int, y: Int)] = [(x + 1, y), (x, y + 1), (x - 1, y), (x, y - 1)]

    for move in moves {
        if move.x >= 0 && move.x < size[1] && move.y >= 0 && move.y < size[0] {
            if maze[move.x][move.y] == 1 {
                if weights[move.x][move.y] > weight + 1 {
                    queue.append((move.x, move.y, weight + 1))
                }
            } else {
                if weights[move.x][move.y] > weight {
                    queue.append((move.x, move.y, weight))
                }
            }
        }
    }
}

print(weights[size[1] - 1][size[0] - 1])
