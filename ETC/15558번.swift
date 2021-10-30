// 출처 : 백준 점프 게임
// https://www.acmicpc.net/problem/15558
// 풀이 : hogumachu

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0], k = nk[1]
var path: [[Int]] = []
var queue: [(x: Int, y: Int, level: Int)] = []
var queueCount = 0
var result = 0
queue.append((0, 0, 0))

for _ in 0..<2 {
    path.append(readLine()!.map { Int(String($0))! })
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: path[0].count), count: path.count)

while queueCount < queue.count && result == 0 {
    let now = queue[queueCount]
    queueCount += 1

    if now.y >= n {
        result = 1
        break
    }

    if !visited[now.x][now.y] {
        visit(now)
    }
}

func visit(_ now: (x: Int, y: Int, level: Int)) {
    visited[now.x][now.y] = true
    if now.y + k >= n {
        result = 1
        return
    }

    if now.y + 1 < n && path[now.x][now.y + 1] == 1  && now.level < now.y + 1 {
        queue.append((now.x, now.y + 1, now.level + 1))
    }

    if now.y - 1 >= 0 && path[now.x][now.y - 1] == 1  && now.level < now.y - 1 {
        queue.append((now.x, now.y - 1, now.level + 1))
    }

    if now.x == 0 {
        if path[1][now.y + k] == 1 && now.level < now.y + k {
            queue.append((1, now.y + k, now.level + 1))
        }
    } else {
        if path[0][now.y + k] == 1 && now.level < now.y + k{
            queue.append((0, now.y + k, now.level + 1))
        }
    }
}

print(result)
