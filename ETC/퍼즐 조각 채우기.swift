// 출처 : 프로그래머스 위클리 챌린지 3주차
// https://programmers.co.kr/learn/courses/30/lessons/84021
// 풀이 : hogumachu

import Foundation

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    var result = 0
    let bp = makePath(game_board, 0, 1)
    var tp = makePath(table, 1, 0)
    var bpMatched: [Int] = []
    var tpMatched: [Int] = []

    for k in 0..<4 {
        for i in 0..<bp.count {
            for j in 0..<tp.count {
                if bp[i].count == tp[j].count && !bpMatched.contains(i) && !tpMatched.contains(j) {
                    if canMatch(bp[i], tp[j]) {
                        result += bp[i].count
                        bpMatched.append(i)
                        tpMatched.append(j)
                    }
                }
            }
        }
        if k == 3 {
            break
        }
        tp = rotate(tp)
    }

    return result
}

func canMatch(_ board: [(Int, Int)], _ table: [(Int, Int)]) -> Bool {
    let x = board[0].0 - table[0].0
    let y = board[0].1 - table[0].1

    for i in 0..<board.count {
        if board[i].0 == table[i].0 + x && board[i].1 == table[i].1 + y {
            continue
        } else {
            return false
        }
    }

    return true
}

func makePath(_ table: [[Int]], _ a: Int, _ b: Int) -> [[(Int, Int)]] {
    var newTable = table
    var path: [[(Int, Int)]] = []
    let n = newTable.count

    func addPath(_ x: Int, _ y: Int) {
        var queue: [(Int, Int)] = []
        var queueIndex = 0

        let moveX = [-1, 0, 1, 0]
        let moveY = [0, 1, 0, -1]

        queue.append((x, y))
        newTable[x][y] = b

        while queueIndex < queue.count {
            let select = queue[queueIndex]
            queueIndex += 1

            for i in 0..<moveX.count {
                if select.0 + moveX[i] >= 0 && select.0 + moveX[i] < n && select.1 + moveY[i] >= 0 && select.1 + moveY[i] < n, newTable[select.0 + moveX[i]][select.1 + moveY[i]] == a {
                    newTable[select.0 + moveX[i]][select.1 + moveY[i]] = b
                    queue.append((select.0 + moveX[i], select.1 + moveY[i]))
                }
            }
        }
        queue.sort(by: {
             if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 < $1.0
            }
        })
        path.append(queue)
    }

    for i in 0..<n {
        for j in 0..<n {
            if newTable[i][j] == a {
                addPath(i, j)
            }
        }
    }
    return path
}

func rotate(_ paths: [[(Int, Int)]]) -> [[(Int, Int)]] {
    var newPaths: [[(Int, Int)]] = []

    for path in paths {
        var newPath: [(Int, Int)] = []

        for p in path {
            newPath.append((-p.1, p.0))
        }

        newPath.sort(by: {
             if $0.0 == $1.0 {
                return $0.1 < $1.1
            } else {
                return $0.0 < $1.0
            }
        })

        newPaths.append(newPath)
    }

    return newPaths
}
