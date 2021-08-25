// 출처 : 프로그래머스 2020 카카오 인턴십 경주로 건설
// https://programmers.co.kr/learn/courses/30/lessons/67259
// 풀이 : hogumachu
// DFS 로 해결함
// 방향에 따라 가격을 다르게 하고 가격이 동일하거나 작을 때 방문
// move 방향에 따라 답이 달라지는 이유를 모르겠음

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    var pay = Array(repeating: Array(repeating: Int.max, count: n), count: n)

    pay[0][0] = 0

    if board[0][1] == 0 {
        pay[0][1] = 100
    }

    if board[1][0] == 0 {
        pay[1][0] = 100
    }

    func visit(_ x: Int, _ y: Int, _ direction: Int) {
        // Direction -> Up:0, Down: 1, Left: 2, Right: 3
        // 처음에는 Up, Down, Left, Right 순서로 했는데
        // 1문제가 틀려서 최대한 빠르게 도착하는 방향인 Right, Down 을 제일 앞에 두니 맞았음
        // 이유는 모르겠음
        let move = [(0, 1, 3), (1, 0, 1), (0, -1, 2), (-1, 0, 0)]

        // DFS
        for move in move {
            // 변경되는 x, y 가 배열의 index 범위를 넘지 않고 board 의 값이 0 일 때 (벽이 아닐 때)
            if x + move.0 >= 0 && x + move.0 < n && y + move.1 >= 0 && y + move.1 < n && board[x + move.0][y + move.1] == 0 {
                // 방향이 동일할 때
                if direction == move.2 {
                    // 현재 값 + 100 보다 크거나 같을 때 방문
                    // 처음에는 같을 때는 뺐는데 몇 문제 틀렸음
                    // 같은 값이라도 방향에 따라 다르기 때문에 같을 때도 방문함
                    if pay[x + move.0][y + move.1] >= pay[x][y] + 100 {
                        pay[x + move.0][y + move.1] = pay[x][y] + 100
                        visit(x + move.0, y + move.1, move.2)
                    }
                    // 현재 값 + 600 (방향 전환 + 직선 도로) 보다 크거나 같을 때 방문
                } else {
                    if pay[x + move.0][y + move.1] >= pay[x][y] + 600 {
                        pay[x + move.0][y + move.1] = pay[x][y] + 600
                        visit(x + move.0, y + move.1, move.2)
                    }
                }
            }
        }
    }

    // 초기 Right 방문
    if board[0][1] == 0 {
        visit(0, 1, 3)
    }

    // 초기 Down 방문
    if board[1][0] == 0 {
        visit(1, 0, 1)
    }

    return pay[n - 1][n - 1]
}
