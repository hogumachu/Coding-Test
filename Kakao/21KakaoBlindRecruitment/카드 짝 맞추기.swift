// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 카드 짝 맞추기
// https://programmers.co.kr/learn/courses/30/lessons/72415
// 풀이 : hogumachu

import Foundation

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    // 카드 위치를 저장할 location 배열
    var location: [[(Int, Int)]] = Array(repeating: [], count: 7)

    // 카드 개수 세기
    var counting = 0

    // 결과
    var result = Int.max

    // 모두 방문하지 않은 배열 (자주 사용하므로 할당함)
    let fixedVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: 4), count: 4)

    // board 에서 카드 위치를 location 에 저장함
    for i in 0..<board.count {
        for j in 0..<board.count {
            if board[i][j] != 0 {
                location[board[i][j]].append((i, j))
                counting += 1
            }
        }
    }

    // 카드 제거 순서 저장할 배열
    var order: [[(Int, Int)]] = []

    // order 에 저장할 함수
    // 카드 선택 순서를 리턴함
    func getPath(_ path: [(Int, Int)], _ counting: Int) {
        // 만약 모든 카드 순서를 설정했으면 리턴
        if counting == 0 {
            order.append(path)
        }
        // order 생성
        for location in location {
            if !location.isEmpty && !path.contains(where: { $0.0 == location[0].0 && $0.1 == location[0].1 }) {
                getPath(path + location, counting - 2)
                getPath(path + [location[1], location[0]], counting - 2)
            }
        }
    }

    // 방문 함수
    func visit(_ now: (Int, Int), _ location: [[Int]], _ order: [(Int, Int)], _ weight: Int, _ visited: [[Bool]]) {
        // 만약 다음 선택할 카드가 없으면 카드 모두 선택한 것이므로 result 갱신
        if order.isEmpty {
            result = min(result, weight)
            return
        }

        // visited 를 변경하기 위해 var 로 설정
        var visited = visited

        // BFS
        func shortPath() -> Int {
            // BFS 를 위한 배열
            var queue: [(Int, Int, Int)] = []

            // 인덱스
            var queueIndex = 0

            // 결과 저장용
            var result = Int.max


            // 방문
            func visit(_ now: (Int, Int, Int)) {
                // 만약 현재 값이 목적지와 같다면
                if now.0 == order[0].0 && now.1 == order[0].1 {
                    // 결과를 현재까지의 weight (now.2) + enter 값 (1) 을 저장하고 리턴
                    result = now.2 + 1
                    return
                }

                // x 를 한칸 아래로 이동 가능하면
                if now.0 + 1 < 4 {
                    // 만약 해당 위치 이동하지 않았으면 이동했다 체크하고 queue 에 추가
                    if !visited[now.0 + 1][now.1] {
                        visited[now.0 + 1][now.1] = true
                        queue.append((now.0 + 1, now.1, now.2 + 1))
                    }

                    // control + 아래 이동
                    var next = 3

                    for i in now.0 + 1..<4 {
                        if location[i][now.1] != 0 {
                            next = i
                            break
                        }
                    }

                    if !visited[next][now.1] {
                        visited[next][now.1] = true
                        queue.append((next, now.1, now.2 + 1))
                    }
                }

                // 위로 이동 + 컨트롤 이동
                if now.0 - 1 >= 0 {
                    if !visited[now.0 - 1][now.1] {
                        visited[now.0 - 1][now.1] = true
                        queue.append((now.0 - 1, now.1, now.2 + 1))
                    }

                    var next = 0

                    for i in stride(from: now.0 - 1, to: 0, by: -1) {
                        if location[i][now.1] != 0 {
                            next = i
                            break
                        }
                    }

                    if !visited[next][now.1] {
                        visited[next][now.1] = true
                        queue.append((next, now.1, now.2 + 1))
                    }

                }

                // 우측 이동 + 컨트롤 이동
                if now.1 + 1 < 4 {
                    if !visited[now.0][now.1 + 1] {
                        visited[now.0][now.1 + 1] = true
                        queue.append((now.0, now.1 + 1, now.2 + 1))
                    }

                    var next = 3

                    for i in now.1 + 1..<4 {
                        if location[now.0][i] != 0 {
                            next = i
                            break
                        }
                    }

                    if !visited[now.0][next] {
                        visited[now.0][next] = true
                        queue.append((now.0, next, now.2 + 1))
                    }

                }

                // 좌측 이동 + 컨트롤 이동
                if now.1 - 1 >= 0 {
                    if !visited[now.0][now.1 - 1] {
                        visited[now.0][now.1 - 1] = true
                        queue.append((now.0, now.1 - 1, now.2 + 1))
                    }

                    var next = 0

                    for i in stride(from: now.1 - 1, to: 0, by: -1) {
                        if location[now.0][i] != 0 {
                            next = i
                            break
                        }
                    }

                    if !visited[now.0][next] {
                        visited[now.0][next] = true
                        queue.append((now.0, next, now.2 + 1))
                    }
                }
            }

            // 초기 값 추가
            queue.append((now.0, now.1, 0))

            // 반복
            while queueIndex < queue.count {
                if result != Int.max {
                    break
                }

                let select = queue[queueIndex]
                queueIndex += 1

                visit(select)
            }

            return result
        }

        // 다음 방문을 위해 location 과 order 를 var 로 함
        var location = location
        var order = order

        // 현재 위치에서 다음 위치 (order[0]) 으로 최단 거리를 구함
        let shortPathWeight = shortPath()

        // order[0] 을 제거하고 저장함
        let next = order.removeFirst()
        // next 위치의 카드를 이미 제거했으니 0 으로 변경함
        location[next.0][next.1] = 0

        // 그리고 방문
        visit(next, location, order, weight + shortPathWeight, fixedVisited)
    }

    // order 생성
    for location in location {
        if !location.isEmpty {
            getPath(location, counting - 2)
            getPath([location[1], location[0]], counting - 2)
        }
    }

    // 생성된 order 로 visit 함수 실행
    for order in order {
        visit((r, c), board, order, 0, fixedVisited)
    }

    return result
}
