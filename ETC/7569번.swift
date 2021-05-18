// 출처 : 백준 토마토
// https://www.acmicpc.net/problem/7569
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let m = input[0], n = input[1], h = input[2]
    var table: [[[Int]]] = Array(repeating: Array(repeating: [], count: n), count: h)
    var queue: [(Int, Int, Int, Int)] = []
    var index = 0
    var result = 0
    for i in 0..<h {
        for j in 0..<n {
            table[i][j] = readLine()!.split(separator: " ").map{Int(String($0))!}
        }
    }

    func visit(_ z: Int, _ x: Int, _ y: Int, _ counting: Int)  -> Void {
        if result < counting {
            result = counting
        }
        if x - 1 >= 0 {
            if table[z][x-1][y] == 0 {
                table[z][x-1][y] = 1
                queue.append((z,x-1,y,counting+1))
            }
        }

        if x + 1 < n {
            if table[z][x+1][y] == 0 {
                table[z][x+1][y] = 1
                queue.append((z,x+1,y,counting+1))
            }
        }

        if y - 1 >= 0 {
            if table[z][x][y-1] == 0 {
                table[z][x][y-1] = 1
                queue.append((z,x,y-1,counting+1))
            }
        }

        if y + 1 < m {
            if table[z][x][y+1] == 0 {
                table[z][x][y+1] = 1
                queue.append((z,x,y+1,counting+1))
            }
        }

        if z - 1 >= 0 {
            if table[z-1][x][y] == 0 {
                table[z-1][x][y] = 1
                queue.append((z-1,x,y,counting+1))
            }
        }

        if z + 1 < h {
            if table[z+1][x][y] == 0 {
                table[z+1][x][y] = 1
                queue.append((z+1,x,y,counting+1))
            }
        }
    }

    for i in 0..<h {
        for j in 0..<n {
            for k in 0..<m {
                table[i][j][k] == 1 ? queue.append((i, j, k, 0)) : nil
            }
        }
    }
    while queue.count > index {
        let select = queue[index]
        index += 1
        visit(select.0, select.1, select.2, select.3)
    }
    for i in 0..<h {
        for j in 0..<n {
            for k in 0..<m {
                if table[i][j][k] == 0 {
                    result = -1
                    break
                }
            }
        }
    }

    print(result)
}

solution()
