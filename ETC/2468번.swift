// 출처 : 백준 안전 영역
// https://www.acmicpc.net/problem/2468
// 풀이 : hogumachu

let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: n)
var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var result = 1
var k = 0
var compareResult = 0
var maxField = 0
(0..<n).forEach({
    graph[$0] = readLine()!.split(separator: " ").map{ Int(String($0))!}
    if graph[$0].max()! > maxField {
        maxField = graph[$0].max()!
    }
})


while k <= maxField {
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && graph[i][j] > k {
                visit(i, j)
                compareResult += 1
            }
        }
    }
    if result < compareResult {
        result = compareResult
    }
    compareResult = 0
    k += 1
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(result)

func visit(_ x: Int, _ y: Int) {
    visited[x][y] = true

    let moveX = [-1, 0, 1, 0]
    let moveY = [0, 1, 0, -1]

    for i in 0..<4 {
        let movedX = x + moveX[i]
        let movedY = y + moveY[i]
        if movedX < n && movedY < n && movedX >= 0 && movedY >= 0 && !visited[movedX][movedY] && graph[movedX][movedY] > k {
            visit(movedX, movedY)
        }
    }
}
