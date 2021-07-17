// 출처 : 백준 치즈
// https://www.acmicpc.net/problem/2636
// 풀이 : hogumachu

let wh = readLine()!.split(separator: " ").map{ Int(String($0))! }
var cheese: [[Int]] = Array(repeating: [], count: wh[0])
var visited = Array(repeating: Array(repeating: false, count: wh[1]), count: wh[0])
var queue: [(Int, Int, Int)] = []
var queueIndex = 0
var result = 0
for i in 0..<wh[0] {
    cheese[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
}

queue.append((0, 0, 1))

while queue.count > queueIndex {
    let select = queue[queueIndex]
    queueIndex += 1
    visit(select.0, select.1, select.2)
}
if queue.count == 1 {
    print(0)
    print(0)
} else {
    print(queue.last!.2 - 1)
    print(queue.filter({$0.2 == queue.last!.2}).count)
}



func visit(_ x: Int, _ y: Int, _ value: Int) {
    visited[x][y] = true

    let movedX = [x + 1, x, x - 1, x]
    let movedY = [y, y + 1, y, y - 1]

    for i in 0..<4 {
        if movedX[i] >= 0 && movedX[i] < wh[0] && movedY[i] >= 0 && movedY[i] < wh[1] {
            if cheese[movedX[i]][movedY[i]] == 0 && !visited[movedX[i]][movedY[i]] {
                visit(movedX[i], movedY[i], value)
            } else if cheese[movedX[i]][movedY[i]] == 1 {
                cheese[movedX[i]][movedY[i]] = value + 1
                visited[movedX[i]][movedY[i]] = true
                queue.append((movedX[i], movedY[i], value + 1))
            }
        }
    }
}
