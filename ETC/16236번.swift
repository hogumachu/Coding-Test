// 출처 : 백준 아기 상어
// https://www.acmicpc.net/problem/16236
// 풀이 : hogumachu

import Foundation

func solution() {
    var sharkSize = 2
    var sharkEatingCount = 0
    var nowIndex: (Int, Int) = (0, 0)
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: [], count: n)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    var queue: [(Int, Int, Int)] = []
    var queueIndex = 0
    var find: [(Int, Int, Int)] = []
    var result = 0

    var movemove: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var movemoveCount = 1

    for i in 0..<n {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
        if nowIndex == (0, 0) {
            for j in 0..<n {
                if table[i][j] == 9 {
                    nowIndex = (i, j)
                    table[i][j] = 0
                    break
                }
            }
        }
    }
    func findFish(_ x: Int, _ y: Int, _ moveCount: Int) -> Void {
        if find.count != 0 {
            if find[0].2 < moveCount {
                return
            }
        }

        if x-1 >= 0 {
            if (table[x-1][y] == 0 || table[x-1][y] == sharkSize) && visited[x-1][y] == false{
                visited[x-1][y] = true
                queue.append((x-1, y, moveCount+1))
            } else if table[x-1][y] < sharkSize && visited[x-1][y] == false {
                if find.count != 0 {
                    if find[0].2 >= moveCount+1 {
                        visited[x-1][y] = true
                        find.append((x-1, y, moveCount+1))
                    }
                } else {
                    visited[x-1][y] = true
                    find.append((x-1, y, moveCount+1))
                }
            }
        }

        if x+1 < n {
            if  (table[x+1][y] == 0 || table[x+1][y] == sharkSize) && visited[x+1][y] == false {
                visited[x+1][y] = true
                queue.append((x+1, y, moveCount+1))
            } else if table[x+1][y] < sharkSize && visited[x+1][y] == false {
                if find.count != 0 {
                    if find[0].2 >= moveCount+1 {
                        visited[x+1][y] = true
                        find.append((x+1, y, moveCount+1))
                    }
                } else {
                    visited[x+1][y] = true
                    find.append((x+1, y, moveCount+1))
                }
            }
        }

        if y-1 >= 0 {
            if  (table[x][y-1] == 0 || table[x][y-1] == sharkSize)  && visited[x][y-1] == false {
                visited[x][y-1] = true
                queue.append((x, y-1, moveCount+1))
            } else if table[x][y-1] < sharkSize && visited[x][y-1] == false {
                if find.count != 0 {
                    if find[0].2 >= moveCount+1 {
                        visited[x][y-1] = true
                        find.append((x, y-1, moveCount+1))
                    }
                } else {
                    visited[x][y-1] = true
                    find.append((x, y-1, moveCount+1))
                }
            }
        }

        if y+1 < n {
            if (table[x][y+1] == 0 || table[x][y+1] == sharkSize)  && visited[x][y+1] == false {
                visited[x][y+1] = true
                queue.append((x, y+1, moveCount+1))
            } else if table[x][y+1] < sharkSize && visited[x][y+1] == false {
                if find.count != 0 {
                    if find[0].2 >= moveCount+1 {
                        visited[x][y+1] = true
                        find.append((x, y+1, moveCount+1))
                    }
                } else {
                    visited[x][y+1] = true
                    find.append((x, y+1, moveCount+1))
                }
            }
        }
    }
    queue.append((nowIndex.0, nowIndex.1, 0))

    while true {
        if find.count != 0 {
            find.sort(by: {
                if $0.2 == $1.2 {
                    if $0.0 == $1.0 {
                        return $0.1 < $1.1
                    } else {
                        return $0.0 < $1.0
                    }
                } else {
                    return $0.2 < $1.2
                }
            })

            sharkEatingCount += 1
            if sharkSize == sharkEatingCount {
                sharkSize += 1
                sharkEatingCount = 0
            }
            let eatFish = find[0]
            result += eatFish.2

            table[eatFish.0][eatFish.1] = 0
            visited = Array(repeating: Array(repeating: false, count: n), count: n)
            visited[eatFish.0][eatFish.1] = true
            find = []
            queue = []
            queue.append((eatFish.0, eatFish.1, 0))
            queueIndex = 0
            movemove[eatFish.0][eatFish.1] = movemoveCount
            movemoveCount += 1
        }

        while queue.count > queueIndex {
            let select = queue[queueIndex]
            queueIndex += 1

            findFish(select.0, select.1, select.2)
        }

        if find.count == 0 {
            break
        }
    }
    print(result)
}

solution()
