// 출처 : 백준 나이트의 이동
// https://www.acmicpc.net/problem/7562
// 풀이 : hogumachu

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let l = Int(readLine()!)!
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: l), count: l)
    let source = readLine()!.split(separator: " ").map{Int(String($0))!}
    let destination = readLine()!.split(separator: " ").map{Int(String($0))!}
    var queue: [(Int, Int, Int)] = []
    var queueIndex = 0
    queue.append((source[0], source[1], 0))

    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        if select.0 == destination[0] && select.1 == destination[1] {
            print(select.2)
            break
        } else if !visited[select.0][select.1]{
            visit(select.0, select.1, select.2)
        }
    }
    func visit(_ x: Int, _ y: Int, _ moved: Int) {
        /*
         case: x - 2 | y - 1, y + 1
         case: x - 1 | y - 2, y + 2
         case: x + 1 | y - 2, y + 2
         case: x + 2 | y - 1, y + 1
        */
        visited[x][y] = true
        let moveX = [-2, -2, -1, -1, 1, 1, 2, 2]
        let moveY = [-1, 1, -2, 2, -2, 2, -1, 1]

        for i in 0..<moveX.count {
            if x + moveX[i] >= 0 && x + moveX[i] < l && y + moveY[i] >= 0 && y + moveY[i] < l {
                queue.append((x + moveX[i], y + moveY[i], moved + 1))
            }
        }

    }

}
