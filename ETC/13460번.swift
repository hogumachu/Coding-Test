// 출처 : 백준 구슬 탈출 2
// https://www.acmicpc.net/problem/13460
// 풀이 : hogumachu

// 1. n, m 읽고 설정
let nm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = nm[0], m = nm[1]
// 2. 위치를 저장할 배열
var location: [[String]] = Array(repeating: [], count: n)
// 3. 방문에 대해 저장을 할 dictionary
var visited: [String: Bool] = [:]
// 4. queue로 사용할 배열과 queueIndex
var queue: [(redX: Int, redY: Int, blueX: Int, blueY: Int)] = []
var queueIndex = 0
// 5. 초기 구슬 위치 저장할 값
var marble: (redX: Int, redY: Int, blueX: Int, blueY: Int) = (0, 0, 0, 0)
// 6. 몇번 움직였는지 저장할 값
var moveCount = 1
// 7.결과 값
var result = -1

// 8. 값을 읽어옴
for i in 0..<n {
    let row = readLine()!.map { String($0) }

    for j in 0..<m {
        location[i].append(row[j])
        switch row[j] {
        // 9. 만약 빨간 구슬이면
        case "R":
            // 구슬 값을 갱신하고
            marble.redX = i
            marble.redY = j
            // 그 위치의 값을 "." (빈 공간) 으로 만들어줌
            location[i][j] = "."
        // 10. 파란 구슬도 빨간 구슬과 동일
        case "B":
            marble.blueX = i
            marble.blueY = j
            location[i][j] = "."
        default:
            continue
        }
    }
}

// 11. 값이 설정된 구슬 값을 queue 에 넣음
queue.append(marble)

// 12. 방문 함수
func visit(_ now: (redX: Int, redY: Int, blueX: Int, blueY: Int)) {
    // 13. 먼저 방문했다고 dictionary 에 저장함
    visited["\(now.redX), \(now.redY), \(now.blueX), \(now.blueY)"] = true

    // 14. 왼쪽으로 이동
    // 만약 빨간 구슬이 파란구슬보다 왼쪽에 있으면
    // redFirst 를 true 로 하고 그렇지 않으면 redFirst 를 false 로 함
    if now.redY < now.blueY {
        move(order: .left, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: true)
    } else {
        move(order: .left, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: false)
    }

    // 15. 오른쪽으로 이동
    // 왼쪽으로 이동의 반대
    if now.redY < now.blueY {
        move(order: .right, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: false)
    } else {
        move(order: .right, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: true)
    }

    // 16. 위로 이동
    // 빨간 구슬이 위에 있으면 redFrist 를 true
    // 그렇지 않으면 false 로 함
    if now.redX < now.blueX {
        move(order: .up, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: true)
    } else {
        move(order: .up, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: false)
    }

    // 17. 아래로 이동
    // 위로 이동의 반대
    if now.redX < now.blueX {
        move(order: .down, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: false)
    } else {
        move(order: .down, red: (now.redX, now.redY), blue: (now.blueX, now.blueY), redFirst: true)
    }
}

// 18. move 함수
func move(order: Order, red: (x: Int, y: Int), blue: (x: Int, y: Int), redFirst: Bool) {
    // 19. 이동한 후의 구슬 위치를 저장할 값
    var movedRed: (x: Int, y: Int) = (red.x, red.y)
    var movedBlue: (x: Int, y: Int) = (blue.x, blue.y)

    switch order {
    // 20. 왼쪽으로 이동
    case .left:
        // 21. 빨간 구슬이 먼저 이동
        if redFirst {
            // 22. 해당 위치가 "." (빈공간) 이면 계속 이동
            while location[movedRed.x][movedRed.y - 1] == "." {
                movedRed.y -= 1
            }

            // 23. 만약 다음 위치가 "O" (구멍) 이면 movedRed = (-1, -1) 로 값을 설정함
            // -1, -1 로 설정한 이유는 파란 구슬과 겹치지 않게 하기 위함
            if location[movedRed.x][movedRed.y - 1] == "O" {
                movedRed = (-1, -1)
            }

            // 24. 파란 구슬이 이동할 위치가 빈공간이고, 그 위치가 빨간 구슬의 위치가 아니면 계속 이동
            while location[movedBlue.x][movedBlue.y - 1] == "." && !(movedBlue.x == movedRed.x && movedBlue.y - 1 == movedRed.y) {
                movedBlue.y -= 1
            }

            // 25. 만약 파란 구슬이 구멍에 빠지면 종료
            if location[movedBlue.x][movedBlue.y - 1] == "O" {
                return
            }

            // 26. 만약 빨간 구슬만 구멍에 빠졌다면
            // result 값을 설정하고 종료
            if movedRed == (-1, -1) {
                result = moveCount
                return
            }

            // 27. 그렇지 않으면 이동한 값에 대해 queue 에 저장
            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))

        // 28. 파란 구슬 먼저 이동
        } else {
            // 29. 파란 구슬이 왼쪽으로 이동 가능할 때 까지 이동
            while location[movedBlue.x][movedBlue.y - 1] == "." {
                movedBlue.y -= 1
            }

            // 30. 만약 다음 이동이 구멍이면 종료
            if location[movedBlue.x][movedBlue.y - 1] == "O" {
                return
            }

            // 31. 빨간 구슬이 이동할 위치가 빈 공간이고 파란 구슬의 위치가 아니면 이동
            while location[movedRed.x][movedRed.y - 1] == "." && !(movedRed.x == movedBlue.x && movedRed.y - 1 == movedBlue.y) {
                movedRed.y -= 1
            }

            // 32. 만약 다음 이동이 구멍이면
            // result 값 갱신하고 종료
            if location[movedRed.x][movedRed.y - 1] == "O" {
                result = moveCount
                return
            }

            // 33. 그렇지 않으면 이동한 값에 대해 queue 에 저장
            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        }

    // 34. 동일하게 구현
    case .right:
        if redFirst {
            while location[movedRed.x][movedRed.y + 1] == "." {
                movedRed.y += 1
            }

            if location[movedRed.x][movedRed.y + 1] == "O" {
                movedRed = (-1, -1)
            }

            while location[movedBlue.x][movedBlue.y + 1] == "." && !(movedBlue.x == movedRed.x && movedBlue.y + 1 == movedRed.y) {
                movedBlue.y += 1
            }

            if location[movedBlue.x][movedBlue.y + 1] == "O" {
                return
            }

            if movedRed == (-1, -1) {
                result = moveCount
                return
            }
            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        } else {
            while location[movedBlue.x][movedBlue.y + 1] == "." {
                movedBlue.y += 1
            }

            if location[movedBlue.x][movedBlue.y + 1] == "O" {
                return
            }

            while location[movedRed.x][movedRed.y + 1] == "." && !(movedRed.x == movedBlue.x && movedRed.y + 1 == movedBlue.y) {
                movedRed.y += 1
            }

            if location[movedRed.x][movedRed.y + 1] == "O" {
                result = moveCount
                return
            }

            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        }
    case .up:
        if redFirst {
            while location[movedRed.x - 1][movedRed.y] == "." {
                movedRed.x -= 1
            }

            if location[movedRed.x - 1][movedRed.y] == "O" {
                movedRed = (-1, -1)
            }

            while location[movedBlue.x - 1][movedBlue.y] == "." && !(movedBlue.x - 1 == movedRed.x && movedBlue.y == movedRed.y) {
                movedBlue.x -= 1
            }

            if location[movedBlue.x - 1][movedBlue.y] == "O" {
                return
            }

            if movedRed == (-1, -1) {
                result = moveCount
                return
            }
            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        } else {
            while location[movedBlue.x - 1][movedBlue.y] == "." {
                movedBlue.x -= 1
            }

            if location[movedBlue.x - 1][movedBlue.y] == "O" {
                return
            }

            while location[movedRed.x - 1][movedRed.y] == "." && !(movedRed.x - 1 == movedBlue.x && movedRed.y == movedBlue.y) {
                movedRed.x -= 1
            }

            if location[movedRed.x - 1][movedRed.y] == "O" {
                result = moveCount
                return
            }

            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        }
    case .down:
        if redFirst {
            while location[movedRed.x + 1][movedRed.y] == "." {
                movedRed.x += 1
            }

            if location[movedRed.x + 1][movedRed.y] == "O" {
                movedRed = (-1, -1)
            }

            while location[movedBlue.x + 1][movedBlue.y] == "." && !(movedBlue.x + 1 == movedRed.x && movedBlue.y == movedRed.y) {
                movedBlue.x += 1
            }

            if location[movedBlue.x + 1][movedBlue.y] == "O" {
                return
            }

            if movedRed == (-1, -1) {
                result = moveCount
                return
            }
            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        } else {
            while location[movedBlue.x + 1][movedBlue.y] == "." {
                movedBlue.x += 1
            }

            if location[movedBlue.x + 1][movedBlue.y] == "O" {
                return
            }

            while location[movedRed.x + 1][movedRed.y] == "." && !(movedRed.x + 1 == movedBlue.x && movedRed.y == movedBlue.y) {
                movedRed.x += 1
            }

            if location[movedRed.x + 1][movedRed.y] == "O" {
                result = moveCount
                return
            }

            queue.append((movedRed.x, movedRed.y, movedBlue.x, movedBlue.y))
        }
    }
}

// 35. 움직인 값이 10 이하이고, queue 값이 index 를 초과하지 않고, 결과 값이 아직 설정되지 않으면 반복함
outer: while moveCount <= 10 && queueIndex < queue.count && result == -1 {
    let queueCount = queue.count

    for i in queueIndex..<queue.count {
        let now = queue[i]

        // 36. 만약 아직 방문하지 않았다면 방문함
        if visited["\(now.redX), \(now.redY), \(now.blueX), \(now.blueY)"] == nil {
            visit(now)
        }
    }
    queueIndex = queueCount
    moveCount += 1
}

// 37. 결과 출력
print(result)

enum Order {
    case left
    case right
    case up
    case down
}
