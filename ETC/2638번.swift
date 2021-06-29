// 출처 : 백준 치즈
// https://www.acmicpc.net/problem/2638
// 풀이 : hogumachu

let size = readLine()!.split(separator: " ").map{Int(String($0))!}
var cheeze: [[Int]] = Array(repeating: [], count: size[0])
var result = 0
var visited = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
let saveVisited = visited
(0..<size[0]).forEach({
    cheeze[$0] = readLine()!.split(separator: " ").map{Int(String($0))!}
})


while true {
    visited = saveVisited
    spread(0, 0)
    for i in 0..<size[0] {
        for j in 0..<size[1] {
            if cheeze[i][j] == 1 {
                visit(i, j)
            }
        }
    }
    var change = false
    for i in 0..<size[0] {
        for j in 0..<size[1] {
            if cheeze[i][j] == -1 {
                cheeze[i][j] = 0
                change = true
            }
        }
    }
    if change {
        result += 1
    } else {
        break
    }
}
print(result)

func spread(_ x: Int, _ y: Int) {
    if visited[x][y] {
        return
    }
    visited[x][y] = true
    if x + 1 < size[0] && !visited[x + 1][y] && cheeze[x + 1][y] == 0 {
        spread(x + 1, y)
    }
    if x - 1 >= 0 && !visited[x - 1][y] && cheeze[x - 1][y] == 0 {
        spread(x - 1, y)
    }
    if y + 1 < size[1] && !visited[x][y + 1] && cheeze[x][y + 1] == 0 {
        spread(x, y + 1)
    }
    if y - 1 >= 0 && !visited[x][y - 1] && cheeze[x][y - 1] == 0 {
        spread(x, y - 1)
    }
}

func visit(_ x: Int, _ y: Int) {
    if cheeze[x][y] != 1 {
        return
    }
    var airCounting = 0
    if x + 1 < size[0] && cheeze[x + 1][y] == 0 && visited[x + 1][y] {
        airCounting += 1
    }
    if x - 1 >= 0 && cheeze[x - 1][y] == 0 && visited[x - 1][y] {
        airCounting += 1
    }
    if y + 1 < size[1] && cheeze[x][y + 1] == 0 && visited[x][y + 1] {
        airCounting += 1
    }
    if y - 1 >= 0 && cheeze[x][y - 1] == 0 && visited[x][y - 1] {
        airCounting += 1
    }
    if airCounting >= 2 {
        cheeze[x][y] = -1
    }
}
