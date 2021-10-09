// 출처 : 백준 뱀
// https://www.acmicpc.net/problem/3190
// 풀이 : hogumachu

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var location: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var snake: [(x: Int, y: Int)] = [(0, 0)]
var snakeIndex = 0
var direction: Direction = .right
var time = 0
var breaked = false

location[0][0] = -1

for _ in 0..<k {
    let apple = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    location[apple[0] - 1][apple[1] - 1] = 1
}

let l = Int(readLine()!)!

outer: for _ in 0..<l {
    let info = readLine()!.split{ $0 == " " }

    for _ in time..<Int(info[0])! {
        if !generate() {
            breaked = true
            break outer
        }
    }
    convertDirection("\(info[1])")
}

while !breaked {
    if !generate() {
        break
    }
}

print(time)

func convertDirection(_ order: String) {
    if order == "L" {
        switch direction {
        case .up:
            direction = .left
        case .down:
            direction = .right
        case .left:
            direction = .down
        case .right:
            direction = .up
        }
    } else {
        switch direction {
        case .up:
            direction = .right
        case .down:
            direction = .left
        case .left:
            direction = .up
        case .right:
            direction = .down
        }
    }
}

func generate() -> Bool {
    time += 1
    let last = snake.last!
    var isApple = false

    switch direction {
    case .up:
        if last.x - 1 < 0 || location[last.x - 1][last.y] == -1 {
            return false
        }
        if location[last.x - 1][last.y] == 1 {
            isApple = true
        }
        snake.append((last.x - 1, last.y))
        location[last.x - 1][last.y] = -1
    case .down:
        if last.x + 1 == n || location[last.x + 1][last.y] == -1 {
            return false
        }
        if location[last.x + 1][last.y] == 1 {
            isApple = true
        }
        snake.append((last.x + 1, last.y))
        location[last.x + 1][last.y] = -1

    case .left:
        if last.y - 1 < 0 || location[last.x][last.y - 1] == -1 {
            return false
        }
        if location[last.x][last.y - 1] == 1 {
            isApple = true
        }
        snake.append((last.x, last.y - 1))
        location[last.x][last.y - 1] = -1
    case .right:
        if last.y + 1 == n || location[last.x][last.y + 1] == -1 {
            return false
        }
        if location[last.x][last.y + 1] == 1 {
            isApple = true
        }
        snake.append((last.x, last.y + 1))
        location[last.x][last.y + 1] = -1
    }

    if !isApple {
        location[snake[snakeIndex].x][snake[snakeIndex].y] = 0
        snakeIndex += 1
    }

    return true
}

enum Direction {
    case up
    case down
    case left
    case right
}
