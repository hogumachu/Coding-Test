// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 카드 짝 맞추기
// https://programmers.co.kr/learn/courses/30/lessons/72415
// 풀이 : hogumachu
// 시간 초과 7개 났음.
// 순열을 구하는 것 보다 BFS 를 하는 방식에서 시간 초과가 난 것 같음
// 전체적으로 배열을 삭제하며 진행하는 방식보다 index 값을 변경하며 진행하는 것이 더 빠를 것 같음

import Foundation

func solution(_ board: [[Int]], _ r: Int, _ c: Int) -> Int {
    var location: [[(Int, Int)]] = Array(repeating: [], count: 7)
    var path: [Int] = []
    var result = Int.max

    for i in 0..<4 {
        for j in 0..<4 {
            if board[i][j] != 0 {
                location[board[i][j]].append((i, j))
            }
        }
    }

    for i in 0..<location.count {
        if !location[i].isEmpty {
            path.append((i))
        }
    }


    func shortPath(_ order: [(Int, Int)], _ start: (Int, Int), _ dest: (Int, Int), _ compareValue: Int) -> Int {
        var queue: [(Int, Int, Int)] = []
        // x, y, weight
        var queueIndex = 0

        let moveX = [-1, 0, 1, 0]
        let moveY = [0, 1, 0, -1]

        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: 4), count: 4)

        for i in 0..<4 {
            if start.0 + moveX[i] >= 0 && start.0 + moveX[i] < 4 && start.1 + moveY[i] >= 0 && start.1 + moveY[i] < 4 {
                queue.append((start.0 + moveX[i], start.1 + moveY[i], 1))
                visited[start.0 + moveX[i]][start.1 + moveY[i]] = true
            }
        }

        var up = (0, start.1)
        var down = (3, start.1)
        var left = (start.0, 0)
        var right = (start.0, 3)

        if start.0 - 1 > 0 {
            for i in stride(from: start.0 - 1, to: 0, by: -1) {
                if order.contains(where: { $0.0 == i && $0.1 == start.1 }) {
                    up = (i, start.1)
                    break
                }
            }
        }

        if start.0 + 1 < 3 {
            for i in start.0 + 1..<3 {
                if order.contains(where: { $0.0 == i && $0.1 == start.1 }) {
                    down = (i, start.1)
                    break
                }
            }
        }

        if start.1 - 1 > 0 {
            for i in stride(from: start.1 - 1, to: 0, by: -1) {
                if order.contains(where: { $0.0 == start.0 && $0.1 == i }) {
                    left = (start.0, i)
                    break
                }
            }
        }

        if start.1 + 1 < 3 {
            for i in start.1 + 1..<3 {
                if order.contains(where: { $0.0 == start.0 && $0.1 == i }) {
                    right = (start.0, i)
                    break
                }
            }
        }

        queue.append((up.0, up.1, 1))
        visited[up.0][up.1] = true

        queue.append((down.0, down.1, 1))
        visited[down.0][down.1] = true

        queue.append((left.0, left.1, 1))
        visited[left.0][left.1] = true

        queue.append((right.0, right.1, 1))
        visited[right.0][right.1] = true



        while queueIndex < queue.count {
            let select = queue[queueIndex]
            queueIndex += 1
            if select.2 < compareValue {
                if select.0 == dest.0 && select.1 == dest.1 {
                    return select.2
                } else {
                    for i in 0..<4 {
                        if select.0 + moveX[i] >= 0 && select.0 + moveX[i] < 4 && select.1 + moveY[i] >= 0 && select.1 + moveY[i] < 4 && !visited[select.0 + moveX[i]][select.1 + moveY[i]] {
                            visited[select.0 + moveX[i]][select.1 + moveY[i]] = true
                            queue.append((select.0 + moveX[i], select.1 + moveY[i], select.2 + 1))
                        }
                    }

                    up = (0, select.1)
                    down = (3, select.1)
                    left = (select.0, 0)
                    right = (select.0, 3)

                    if select.0 - 1 > 0 {
                        for i in stride(from: select.0 - 1, to: 0, by: -1) {
                            if order.contains(where: { $0.0 == i && $0.1 == select.1 }) {
                                up = (i, select.1)
                                break
                            }
                        }
                    }


                    if select.0 + 1 < 3 {
                        for i in select.0 + 1..<3 {
                            if order.contains(where: { $0.0 == i && $0.1 == select.1 }) {
                                down = (i, select.1)
                                break
                            }
                        }
                    }

                    if select.1 - 1 > 0 {
                        for i in stride(from: select.1 - 1, to: 0, by: -1) {
                            if order.contains(where: { $0.0 == select.0 && $0.1 == i }) {
                                left = (select.0, i)
                                break
                            }
                        }
                    }

                    if select.1 + 1 < 3 {
                        for i in select.1 + 1..<3 {
                            if order.contains(where: { $0.0 == select.0 && $0.1 == i }) {
                                right = (select.0, i)
                                break
                            }
                        }
                    }

                    if !visited[up.0][up.1] {
                        visited[up.0][up.1] = true
                        queue.append((up.0, up.1, select.2 + 1))
                    }

                    if !visited[left.0][left.1] {
                        visited[left.0][left.1] = true
                        queue.append((left.0, left.1, select.2 + 1))
                    }

                    if !visited[right.0][right.1]  {
                        visited[right.0][right.1] = true
                        queue.append((right.0, right.1, select.2 + 1))
                    }

                    if !visited[down.0][down.1] {
                        visited[down.0][down.1] = true
                        queue.append((down.0, down.1, select.2 + 1))
                    }
                }
            }
        }
        return compareValue
    }

    func visit(_ order: [(Int, Int)], _ sum: Int, _ x: Int, _ y: Int) {
        if sum >= result {
            return
        }
        if order.isEmpty {
            result = min(result, sum)
        } else {
            var newOrder = order
            let a = newOrder.removeLast()
            let b = newOrder.removeLast()
            var move = 2

            if x != a.0 || y != a.1 {
                move += shortPath(order, (x, y), a, abs(a.0 - x) + abs(a.1 - y))
            }

            move += shortPath(order, a, b, abs(a.0 - b.0) + abs(a.1 - b.1))

            visit(newOrder, sum + move, b.0, b.1)
        }
    }

    func getOrder(_ arr: [Int], _ order: [(Int, Int)]) {
        if arr.isEmpty {
            var newOrder: [(Int, Int)] = []
            for i in order {
                newOrder.append(location[i.0][i.1])
            }
            visit(newOrder, 0, r, c)
        } else {
            var newArr = arr
            let value = newArr.removeLast()
            getOrder(newArr, order + [(value, 0), (value, 1)])
            getOrder(newArr, order + [(value, 1), (value, 0)])
        }
    }

    func getPath(_ arr: [Int], _ visited: [Bool]) {
        if arr.count == path.count {
            getOrder(arr, [])
        }
        for i in path {
            if !visited[i] {
                var newV = visited
                newV[i] = true
                getPath(arr + [i], newV)
            }
        }
    }

    getPath([], Array(repeating: false, count: 7))

    return result
}
