// 출처 : 백준 탈출
// https://www.acmicpc.net/problem/3055
// 풀이 : hogumachu

let size = readLine()!.split { $0 == " " }.map { Int(String($0))! }
var location: [[Int]] = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
var water: [(x: Int, y: Int)] = []
var waterIndex = 0
var destination: (x: Int, y: Int) = (0, 0)
var queue: [(x: Int, y: Int)] = []
var queueIndex = 0
var queueLevel = 0
var result = -1

for i in 0..<size[0] {
    let row = readLine()!.map { String($0) }

    for j in 0..<size[1] {
        switch row[j] {
        case "D":
            destination = (i, j)
            location[i][j] = 2
        case "X":
            location[i][j] = 1
        case "S":
            queue.append((i, j))
        case "*":
            water.append((i, j))
            location[i][j] = -1
        default:
            continue
        }
    }
}

outer: while queueIndex < queue.count {
    let queueCount = queue.count

    for i in queueIndex..<queueCount {
        let now = queue[i]

        if now == destination {
            result = queueLevel
            break outer
        }

        if location[now.x][now.y] == 0 && !visited[now.x][now.y] {
            visit(now.x, now.y)
        }
    }

    updateWater()

    queueIndex = queueCount
    queueLevel += 1
}

func visit(_ x: Int, _ y: Int) {
    visited[x][y] = true
    let moves: [(x: Int, y: Int)] = [(x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)]

    for move in moves {
        if move.x >= 0 && move.x < size[0] && move.y >= 0 && move.y < size[1] && (location[move.x][move.y] == 0 || location[move.x][move.y] == 2) && !visited[move.x][move.y] {
            queue.append(move)
        }
    }
}

func updateWater() {
    let waterCount = water.count

    for i in waterIndex..<waterCount {
        let moves: [(x: Int, y: Int)] = [(water[i].x + 1, water[i].y), (water[i].x - 1, water[i].y),
                                         (water[i].x, water[i].y + 1), (water[i].x, water[i].y - 1)
        ]

        for move in moves {
            if move.x >= 0 && move.x < size[0] && move.y >= 0 && move.y < size[1] &&
                location[move.x][move.y] == 0 && !water.contains(where: { $0 == move}) {
                location[move.x][move.y] = -1
                water.append(move)
            }
        }
    }

    waterIndex = waterCount
}

print(result == -1 ? "KAKTUS" : result)
