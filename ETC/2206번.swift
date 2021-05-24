// 출처 : 백준 벽 부수고 이동하기
// https://www.acmicpc.net/problem/2206
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var table: [[Int]] = Array(repeating: [], count: n)
    var graph: [[(Int, Int)]] = Array(repeating: Array(repeating: (-1, -1), count: m), count: n)
    graph[0][0] = (1, -1)
    var queue: [(Int, Int)] = []
    for i in 0..<n {
        table[i] = readLine()!.map{Int(String($0))!}
    }
    func visit(_ x: Int, _ y: Int) -> Void {
        if x-1 >= 0 {
            if table[x-1][y] == 1 {
                if graph[x][y].0 != -1 {
                    if graph[x-1][y].1 == -1 || graph[x-1][y].1 > graph[x][y].0 + 1{
                        graph[x-1][y].1 = graph[x][y].0 + 1
//                        visit(x-1, y)
                        queue.append((x-1, y))
                    }
                }
            } else {
                if graph[x][y].0 != -1 {
                    if graph[x-1][y].0 == -1 || graph[x-1][y].0 > graph[x][y].0 + 1 {
                        graph[x-1][y].0 = graph[x][y].0 + 1
//                        visit(x-1, y)
                        queue.append((x-1, y))
                    }
                }

                if graph[x][y].1 != -1 {
                    if graph[x-1][y].1 == -1 || graph[x-1][y].1 > graph[x][y].1 + 1 {
                        graph[x-1][y].1 = graph[x][y].1 + 1
//                        visit(x-1, y)
                        queue.append((x-1, y))
                    }
                }
            }
        }

        if x+1 < n {
            if table[x+1][y] == 1 {
                if graph[x][y].0 != -1 {
                    if graph[x+1][y].1 == -1 || graph[x+1][y].1 > graph[x][y].0 + 1{
                        graph[x+1][y].1 = graph[x][y].0 + 1
//                        visit(x+1, y)
                        queue.append((x+1, y))
                    }
                }
            } else {
                if graph[x][y].0 != -1 {
                    if graph[x+1][y].0 == -1 || graph[x+1][y].0 > graph[x][y].0 + 1 {
                        graph[x+1][y].0 = graph[x][y].0 + 1
//                        visit(x+1, y)
                        queue.append((x+1, y))
                    }
                }

                if graph[x][y].1 != -1 {
                    if graph[x+1][y].1 == -1 || graph[x+1][y].1 > graph[x][y].1 + 1 {
                        graph[x+1][y].1 = graph[x][y].1 + 1
//                        visit(x+1, y)
                        queue.append((x+1, y))
                    }
                }
            }
        }

        if y-1 >= 0 {
            if table[x][y-1] == 1 {
                if graph[x][y].0 != -1 {
                    if graph[x][y-1].1 == -1 || graph[x][y-1].1 > graph[x][y].0 + 1{
                        graph[x][y-1].1 = graph[x][y].0 + 1
//                        visit(x, y-1)
                        queue.append((x, y-1))
                    }
                }
            } else {
                if graph[x][y].0 != -1 {
                    if graph[x][y-1].0 == -1 || graph[x][y-1].0 > graph[x][y].0 + 1 {
                        graph[x][y-1].0 = graph[x][y].0 + 1
//                        visit(x, y-1)
                        queue.append((x, y-1))
                    }
                }

                if graph[x][y].1 != -1 {
                    if graph[x][y-1].1 == -1 || graph[x][y-1].1 > graph[x][y].1 + 1 {
                        graph[x][y-1].1 = graph[x][y].1 + 1
//                        visit(x, y-1)
                        queue.append((x, y-1))
                    }
                }
            }
        }

        if y+1 < m {
            if table[x][y+1] == 1 {
                if graph[x][y].0 != -1 {
                    if graph[x][y+1].1 == -1 || graph[x][y+1].1 > graph[x][y].0 + 1{
                        graph[x][y+1].1 = graph[x][y].0 + 1
//                        visit(x, y+1)
                        queue.append((x, y+1))
                    }
                }
            } else {
                if graph[x][y].0 != -1 {
                    if graph[x][y+1].0 == -1 || graph[x][y+1].0 > graph[x][y].0 + 1 {
                        graph[x][y+1].0 = graph[x][y].0 + 1
//                        visit(x, y+1)
                        queue.append((x, y+1))
                    }
                }

                if graph[x][y].1 != -1 {
                    if graph[x][y+1].1 == -1 || graph[x][y+1].1 > graph[x][y].1 + 1 {
                        graph[x][y+1].1 = graph[x][y].1 + 1
//                        visit(x, y+1)
                        queue.append((x, y+1))
                    }
                }
            }
        }
    }

    queue.append((0, 0))
    var queueIndex = 0
    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        visit(select.0, select.1)
    }
    if graph[n-1][m-1].0 == -1 {
        print(graph[n-1][m-1].1)
    } else if graph[n-1][m-1].1 == -1 {
        print(graph[n-1][m-1].0)
    } else if graph[n-1][m-1].0 != -1 && graph[n-1][m-1].1 != -1 {
        print(min(graph[n-1][m-1].0, graph[n-1][m-1].1))
    }

}

solution()
