// 출처 : 프로그래머스 Summer/Winter Coding(~2018) 배달
// https://programmers.co.kr/learn/courses/30/lessons/12978
// 풀이 : hogumachu

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 1
    var path: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
    var queue: [(Int, Int, Int)] = []
    for i in 0..<road.count {
        if path[road[i][0]][road[i][1]] == 0 || path[road[i][0]][road[i][1]] > road[i][2] {
            path[road[i][0]][road[i][1]] = road[i][2]
        }
        if path[road[i][1]][road[i][0]] == 0 || path[road[i][1]][road[i][0]] > road[i][2] {
            path[road[i][1]][road[i][0]] = road[i][2]
        }
        queue.append((road[i][0], road[i][1], road[i][2]))
        queue.append((road[i][1], road[i][0], road[i][2]))
    }

    func visit(_ x: Int, _ y: Int, _ sum: Int) -> Void {
        for i in 1...N {
            if x != i && y != i && x != y && (path[x][i] == 0 || path[y][i] + sum < path[x][i]) && path[y][i] != 0 {
                path[x][i] = sum + path[y][i]
                queue.append((x, i, path[x][i]))
            }
        }
    }
    var queueIndex = 0
    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        if path[select.0][select.1] == 0 || path[select.0][select.1] >= select.2 {
            path[select.0][select.1] = select.2
            visit(select.0, select.1, select.2)
        }
    }

    for i in 2...N {
        if path[1][i] <= k && path[1][i] != 0 {
            answer += 1
        }
    }
    return answer
}
