// 출처 : 프로그래머스 2019 KAKAO BLIND RECRUITMENT 블록 게임
// https://programmers.co.kr/learn/courses/30/lessons/42894
// 풀이 : hogumachu
// 규칙대로 진행하면 됌
// 여러 케이스가 있어서 해당 케이스에 대해 열거형으로 생성하였고
// 그 케이스에 해당하고 그 케이스를 제거할 수 있으면
// 그 케이스를 제거하고 제거된 위치에서 한칸 올라가서 다시 제거할 수 있는 블록이 있나 시작함

import Foundation

func solution(_ board: [[Int]]) -> Int {
    // board 가 0으로만 된 줄을 제거하기 위해 getPath 함수로 0으로만 구성된 값이 아닌 index 를 얻음
    let startX = getXpath(true, board)
    let endX = getXpath(false, board)
    let startY = getYpath(true, board)
    let endY = getYpath(false, board)

    // board 크기를 줄이기 위한 newBoard 생성
    var newBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: endY - startY + 1), count: endX - startX + 1)

    // 결과 저장
    var result = 0

    // 새로운 board 에 기존 board 있는 값을 저장
    for i in startX...endX {
        for j in startY...endY {
            if board[i][j] != 0 {
                newBoard[i - startX][j - startY] = board[i][j]
            }
        }
    }

    // 제거가 가능한지에 대한 함수
    func canRemove(_ x: Int, _ y: Int) -> RemoveCase {
        // 현재 값을 얻음
        let n = newBoard[x][y]

        // 예시의 1번째 줄에서 3번째 모양 (ㄴ 모양)
        // 1.3
        if x + 1 < newBoard.count && y + 2 < newBoard[0].count {
            if newBoard[x + 1][y] == n && newBoard[x + 1][y + 1] == n && newBoard[x + 1][y + 2] == n {
                if newBoard[x][y + 1] == 0 && newBoard[x][y + 2] == 0 {
                    return .oneThree
                }
            }
        }


        // 1.4 모양 (ㄴ을 반시계 회전한 모양)
        // 1.4
        if x + 2 < newBoard.count && y - 1 >= 0 {
            if newBoard[x + 1][y] == n && newBoard[x + 2][y] == n && newBoard[x + 2][y - 1] == n {
                if newBoard[x][y - 1] == 0 && newBoard[x + 1][y - 1] == 0 {
                    return .oneFour
                }
            }
        }

        // 2.2
        if x + 2 < newBoard.count && y + 1 < newBoard[0].count {
            if newBoard[x + 1][y] == n && newBoard[x + 2][y] == n && newBoard[x + 2][y + 1] == n {
                if newBoard[x][y + 1] == 0 && newBoard[x + 1][y + 1] == 0 {
                    return .twoTwo
                }
            }
        }

        // 2.3
        if x + 1 < newBoard.count && y - 2 >= 0 {
            if newBoard[x + 1][y] == n && newBoard[x + 1][y - 1] == n && newBoard[x + 1][y - 2] == n {
                if newBoard[x][y - 1] == 0 && newBoard[x][y - 2] == 0 {
                    return .twoThree
                }
            }
        }

        // 3.1
        if x + 1 < newBoard.count && y - 1 >= 0 && y + 1 < newBoard[0].count {
            if newBoard[x + 1][y] == n && newBoard[x + 1][y - 1] == n && newBoard[x + 1][y + 1] == n {
                if newBoard[x][y - 1] == 0 && newBoard[x][y + 1] == 0 {
                    return .threeOne
                }
            }
        }

        // 만약 위 모든 케이스가 아니면 .cant
        return .cant
    }

    // 방문하여 canRemove 가 가능한지에 대해 비교하는 함수
    func visit(_ a: Int, _ b: Int) {
        // a 부터 시작해서 newBoard 까지 반복
        for i in a..<newBoard.count {
            // b 부터 시작해서 newBoard[i] 까지 반복
            for j in b..<newBoard[i].count {
                // 만약 이 공간에 블록이 있다면
                if newBoard[i][j] != 0 {
                    // 제거 가능한지 확인
                    let removeOrder = canRemove(i, j)


                    switch removeOrder {
                    // 1.3 이면
                    case .oneThree:
                        // 먼저 제거 가능하다 보고
                        var can = true

                        // y축을 고정하고 반복함
                        kRoop: for k in [j + 1, j + 2] {
                            for x in 0..<newBoard.count {
                                // 비어있으면 계속 진행하고
                                if newBoard[x][k] == 0 {
                                    continue
                                // 원하는 블록이 나오면 break
                                } else if newBoard[x][k] == newBoard[i][j] {
                                    break
                                // 그렇지 않으면 제거가 불가능 (다른 블록이 위에 있다는 의미)
                                } else {
                                    can = false
                                    break kRoop
                                }
                            }
                        }

                        // 만약 제거가 가능하면
                        // 해당 위치의 블록을 제거하고 결과값을 1 증가
                        // 그리고 최신화된 board 를 방문하는데
                        // 0, 0 으로 방문하면 너무 오래걸릴 것 같아
                        // 제거된 위치에서 한칸 위로 가서 방문함
                        if can {
                            newBoard[i][j] = 0
                            newBoard[i + 1][j] = 0
                            newBoard[i + 1][j + 1] = 0
                            newBoard[i + 1][j + 2] = 0
                            result += 1
                            visit(max(i - 1, 0), 0)
                            return
                        }
                    case .oneFour:
                        var can = true

                        kRoop: for k in [j - 1] {
                            for x in 0..<newBoard.count {
                                if newBoard[x][k] == 0 {
                                    continue
                                } else if newBoard[x][k] == newBoard[i][j] {
                                    break
                                } else {
                                    can = false
                                    break kRoop
                                }
                            }
                        }

                        if can {
                            newBoard[i][j] = 0
                            newBoard[i + 1][j] = 0
                            newBoard[i + 2][j] = 0
                            newBoard[i + 2][j - 1] = 0
                            result += 1
                            visit(max(i - 1, 0), 0)
                            return
                        }
                    case .twoTwo:
                        var can = true

                        kRoop: for k in [j + 1] {
                            for x in 0..<newBoard.count {
                                if newBoard[x][k] == 0 {
                                    continue
                                } else if newBoard[x][k] == newBoard[i][j] {
                                    break
                                } else {
                                    can = false
                                    break kRoop
                                }
                            }
                        }

                        if can {
                            newBoard[i][j] = 0
                            newBoard[i + 1][j] = 0
                            newBoard[i + 2][j] = 0
                            newBoard[i + 2][j + 1] = 0
                            result += 1
                            visit(max(i - 1, 0), 0)
                            return
                        }
                    case .twoThree:
                        var can = true

                        kRoop: for k in [j - 2, j - 1] {
                            for x in 0..<newBoard.count {
                                if newBoard[x][k] == 0 {
                                    continue
                                } else if newBoard[x][k] == newBoard[i][j] {
                                    break
                                } else {
                                    can = false
                                    break kRoop
                                }
                            }
                        }

                        if can {
                            newBoard[i][j] = 0
                            newBoard[i + 1][j] = 0
                            newBoard[i + 1][j - 1] = 0
                            newBoard[i + 1][j - 2] = 0
                            result += 1
                            visit(max(i - 1, 0), 0)
                            return
                        }
                    case .threeOne:
                        var can = true

                        kRoop: for k in [j - 1, j + 1] {
                            for x in 0..<newBoard.count {
                                if newBoard[x][k] == 0 {
                                    continue
                                } else if newBoard[x][k] == newBoard[i][j] {
                                    break
                                } else {
                                    can = false
                                    break kRoop
                                }
                            }
                        }

                        if can {
                            newBoard[i][j] = 0
                            newBoard[i + 1][j] = 0
                            newBoard[i + 1][j - 1] = 0
                            newBoard[i + 1][j + 1] = 0
                            result += 1
                            visit(max(i - 1, 0), 0)
                            return
                        }
                    case .cant:
                        break
                    }
                }
            }
        }
    }

    // 초기 0, 0 에서 방문
    visit(0, 0)

    return result
}

// board 에 0 아닌 다른 값이 들어있는 위치를 찾는 함수
func getXpath(_ isStart: Bool, _ board: [[Int]]) -> Int {
    if isStart {
        for i in 0..<board.count {
            for j in 0..<board.count {
                if board[i][j] != 0 {
                    return i
                }
            }
        }
        return 0
    } else {
        for i in stride(from: board.count - 1, through: 0, by: -1) {
            for j in 0..<board.count {
                if board[i][j] != 0 {
                    return i
                }
            }
        }
        return board.count - 1
    }

}

func getYpath(_ isStart: Bool, _ board: [[Int]]) -> Int {
    if isStart {
        for i in 0..<board.count {
            for j in 0..<board.count {
                if board[j][i] != 0 {
                    return i
                }
            }
        }
        return 0
    } else {
        for i in stride(from: board.count - 1, through: 0, by: -1) {
            for j in 0..<board.count {
                if board[j][i] != 0 {
                    return i
                }
            }
        }
        return board.count - 1
    }
}

enum RemoveCase {
    case oneThree
    case oneFour
    case twoTwo
    case twoThree
    case threeOne
    case cant

}
