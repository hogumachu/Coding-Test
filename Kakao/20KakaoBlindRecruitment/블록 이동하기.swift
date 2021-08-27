// 출처 : 프로그래머스 2020 KAKAO BLIND RECRUITMENT 블록 이동하기
// https://programmers.co.kr/learn/courses/30/lessons/60063
// 풀이 : hogumachu
// 테스트 케이스 3개가 틀려서 애먹었음
// 로직은 맞았는데 왜 틀렸나해서 여러 테스트 케이스를 생성하여 출력해봤음
// visited dictionary 에 string 을 unique 하게 하지 않아서 틀렸던 거임
// 예를 들어 (1, 11) (1, 12) 방문을 한 것과 (11, 1), (11, 2) 방문 한 것이 같았음
// visited["111112"] 이런 방식으로 했었음
// 그래서 visited["1 11 1 12], visited["11 1 11 2"] 이렇게 띄어쓰기를 주고 제출하니 맞았음

// 단순한 BFS 문제인데 조건이 까다로움
// 숫자 하나하나 보면서 틀린 것이 없나 확인해야 하는 문제 외에는 어려운 것은 없는 듯

import Foundation

func solution(_ board:[[Int]]) -> Int {
    // board.count 를 자주 불러오니 n 이라고 설정했음
    let n = board.count

    // 방문한 곳의 값을 저장할 dictionary
    var visited: [String: Int] = [:]

    // 초기 위치에 대한 값을 저장함
    visited["0 0 0 1"] = 0

    // 결과는 최대치로 설정함
    var result = Int.max

    // BFS 를 하기 위한 queue
    var queue: [(Int, Int, Int, Int, Bool, Int)] = []
    // queue 에 대한 index
    var queueIndex = 0
    // 초기 값을 queue 에 넣음
    queue.append((0, 0, 0, 1, false, 0))

    // bfs
    func visit(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ vertical: Bool, _ value: Int) {
        // *** visit은 x1 y1 이 x2 y2 보다 작거나 같게 했음 ***

        // 만약 현재 상태가 수직이라면
        if vertical {
            // 우측 + 우측 회전
            // 수직에서 우측으로 이동할 수 있다면 우측으로 회전도 가능함
            if y1 + 1 < n && y2 + 1 < n && board[x1][y1 + 1] == 0 && board[x2][y2 + 1] == 0 {
                // 우측 이동에 대한 조건
                if visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"] == nil || visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"]! > value + 1{
                    visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"] = value + 1
                    queue.append((x1, y1 + 1, x2, y2 + 1, vertical, value + 1))
                }

                // 회전
                // x1 y1 고정
                // x1 y1 을 고정하고 x2 y2 의 값을 변경함
                if visited["\(x1) \(y1) \(x1) \(y1 + 1)"] == nil || visited["\(x1) \(y1) \(x1) \(y1 + 1)"]! > value + 1{
                    visited["\(x1) \(y1) \(x1) \(y1 + 1)"] = value + 1
                    queue.append((x1, y1, x1, y1 + 1, !vertical, value + 1))
                }
                // x2 y2 고정
                // x2 y2 를 고정하고 x1 x1 의 값을 변경
                if visited["\(x2) \(y2) \(x2) \(y2 + 1)"] == nil || visited["\(x2) \(y2) \(x2) \(y2 + 1)"]! > value + 1 {
                    visited["\(x2) \(y2) \(x2) \(y2 + 1)"] = value + 1
                    queue.append((x2, y2, x2, y2 + 1, !vertical, value + 1))
                }
            }
            // 위와 동일하므로 생략함

            // 아래
            if x2 + 1 < n && board[x1 + 1][y1] == 0 && board[x2 + 1][y2] == 0 {
                if visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"] == nil || visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"]! > value + 1 {
                    visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"] = value + 1
                    queue.append((x1 + 1, y1, x2 + 1, y2, vertical, value + 1))
                }
            }
            // 좌측 + 좌측 회전
            if y1 - 1 >= 0 && y2 - 1 >= 0 && board[x1][y1 - 1] == 0 && board[x2][y2 - 1] == 0 {
                if visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"] == nil || visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"]! > value + 1 {
                    visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"] = value + 1
                    queue.append((x1, y1 - 1, x2, y2 - 1, vertical, value + 1))
                }

                // 회전
                // x1 y1 고정
                if visited["\(x1) \(y1 - 1) \(x1) \(y1)"] == nil || visited["\(x1) \(y1 - 1) \(x1) \(y1)"]! > value + 1 {
                    visited["\(x1) \(y1 - 1) \(x1) \(y1)"] = value + 1
                    queue.append((x1, y1 - 1, x1, y1, !vertical, value + 1))
                }
                // x2 y2 고정
                if visited["\(x2) \(y2 - 1) \(x2) \(y2)"] == nil || visited["\(x2) \(y2 - 1) \(x2) \(y2)"]! > value + 1 {
                    visited["\(x2) \(y2 - 1) \(x2) \(y2 )"] = value + 1
                    queue.append((x2, y2 - 1, x2, y2, !vertical, value + 1))
                }
            }
            // 위
            if x1 - 1 >= 0 && board[x1 - 1][y1] == 0 && board[x2 - 1][y2] == 0 {
                if visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"] == nil || visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"]! > value + 1 {
                    visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"] = value + 1
                    queue.append((x1 - 1, y1, x2 - 1, y2, vertical, value + 1))
                }
            }

        } else {
            // 우측
            if y2 + 1 < n && board[x2][y2 + 1] == 0 && board[x1][y1 + 1] == 0 {
                if visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"] == nil || visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"]! > value + 1 {
                    visited["\(x1) \(y1 + 1) \(x2) \(y2 + 1)"] = value + 1
                    queue.append((x1, y1 + 1, x2, y2 + 1, vertical, value + 1))
                }
            }
            // 아래 + 아래 회전
            if x1 + 1 < n && board[x1 + 1][y1] == 0 && board[x2 + 1][y2] == 0 {
                if visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"] == nil || visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"]! > value + 1 {
                    visited["\(x1 + 1) \(y1) \(x2 + 1) \(y2)"] = value + 1
                    queue.append((x1 + 1, y1, x2 + 1, y2, vertical, value + 1))
                }

                // 회전
                // x1y1 고정
                if visited["\(x1) \(y1) \(x1 + 1) \(y1)"] == nil || visited["\(x1) \(y1) \(x1 + 1) \(y1)"]! > value + 1 {
                    visited["\(x1) \(y1) \(x1 + 1) \(y1)"] = value + 1
                    queue.append((x1, y1, x1 + 1, y1, !vertical, value + 1))
                }

                // x2y2 고정
                if visited["\(x2) \(y2) \(x2 + 1) \(y2)"] == nil || visited["\(x2) \(y2) \(x2 + 1) \(y2)"]! > value + 1 {
                    visited["\(x2) \(y2) \(x2 + 1) \(y2)"] = value + 1
                    queue.append((x2, y2, x2 + 1, y2, !vertical, value + 1))
                }

            }
            // 좌측
            if y1 - 1 >= 0 && board[x1][y1 - 1] == 0 && board[x2][y2 - 1] == 0 {
                if visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"] == nil || visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"]! > value + 1 {
                    visited["\(x1) \(y1 - 1) \(x2) \(y2 - 1)"] = value + 1
                    queue.append((x1, y1 - 1, x2, y2 - 1, vertical, value + 1))
                }
            }
            // 위 + 위 회전
            if x1 - 1 >= 0 && board[x1 - 1][y1] == 0 && board[x2 - 1][y2] == 0 {
                if visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"] == nil || visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"]! > value + 1 {
                    visited["\(x1 - 1) \(y1) \(x2 - 1) \(y2)"] = value + 1
                    queue.append((x1 - 1, y1, x2 - 1, y2, vertical, value + 1))
                }

                // 회전
                // x1y1 고정

                if visited["\(x1 - 1) \(y1) \(x1) \(y1)"] == nil || visited["\(x1 - 1) \(y1) \(x1) \(y1)"]! > value + 1 {
                    visited["\(x1 - 1) \(y1) \(x1) \(y1)"] = value + 1
                    queue.append((x1 - 1, y1, x1, y1, !vertical, value + 1))
                }

                // x2y2 고정

                if visited["\(x2 - 1) \(y2) \(x2) \(y2)"] == nil || visited["\(x2 - 1) \(y2) \(x2) \(y2)"]! > value + 1 {
                    visited["\(x2 - 1) \(y2) \(x2) \(y2)"] = value + 1
                    queue.append((x2 - 1, y2, x2, y2, !vertical, value + 1))
                }
            }
        }
    }

    // bfs 를 돌리기 위한 while 문
    while queueIndex < queue.count {
        let select = queue[queueIndex]
        queueIndex += 1

        // bfs 이므로 답을 찾으면 바로 break 해도 된다 -> 이 뒤로 queue 에는 select.5 보다 크거나 같은 값들만 들어오기 때문
        if (select.0 == n - 1 && select.1 == n - 1) || (select.2 == n - 1 && select.3 == n - 1) {
            result = select.5
            break
        }

        // 만약 visited 값이 select.5 와 같다면 (최소 값이라면) 함수 호출함
        if visited["\(select.0) \(select.1) \(select.2) \(select.3)"]! == select.5 {
            visit(select.0 , select.1, select.2, select.3, select.4, select.5)
        }

    }


    return result
}
