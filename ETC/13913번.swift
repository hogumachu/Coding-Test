// 출처 : 백준 숨바꼭질 4
// https://www.acmicpc.net/problem/13913
// 풀이 : hogumachu

let NK = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let n = NK[0], k = NK[1]
let size = 100_001

var beforeRoute: [Int] = Array(repeating: -1, count: size)
var visited: [Bool] = Array(repeating: false, count: size)
var queue: [(location: Int, before: Int)] = []
var queueIndex = 0
var moveCount = 0
var result = ""

queue.append((n, n))

outer: while queueIndex < queue.count {
    let queueCount = queue.count

    for i in queueIndex..<queueCount {
        let now = queue[i]

        if !visited[now.location] {
            beforeRoute[now.location] = now.before

            if now.location == k {
                generateResult(k)
                break outer
            }

            visit(now.location)
        }
    }

    queueIndex = queueCount
    moveCount += 1
}

func generateResult(_ now: Int) {
    result = "\(now) " + result

    var now = beforeRoute[now]

    while beforeRoute[now] != now {
        result = "\(now) " + result
        now = beforeRoute[now]
    }
    result = "\(now) " + result
}

func visit(_ location: Int) {
    visited[location] = true

    let moves = [location * 2, location + 1, location - 1]

    for move in moves {
        if move >= 0 && move < size && !visited[move] {
            queue.append((move, location))
        }
    }
}

if n == k {
    print(0)
    print(n)
} else {
    print(moveCount)
    print(result)
}
