// 출처 : 백준 소수 경로
// https://www.acmicpc.net/problem/1963
// 풀이 : hogumachu

let tc = Int(readLine()!)!
var isPrime: [Bool] = Array(repeating: true, count: 10_000)

isPrime[0] = false
isPrime[1] = false

for i in 2..<10_000 {
    if isPrime[i] {
        for j in 2..<5_000 {
            if i * j >= 10_000 {
                break
            } else {
                isPrime[i * j] = false
            }
        }
    }

}

for _ in 0..<tc {
    var visited: [Bool] = Array(repeating: false, count: 10_000)
    var queue: [(Int, Int)] = []
    var queueIndex = 0
    let primes = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var result = -1
    queue.append((primes[0], 0))

    while queue.count > queueIndex && result == -1 {
        let select = queue[queueIndex]
        queueIndex += 1
        visit(select.0, select.1)
    }

    print(result == -1 ? "impossible" : result)


    func visit(_ now: Int, _ value: Int) {
        visited[now] = true
        if now == primes[1] {
            result = value
            return
        }

        for i in 0...9 {
            let one = (now / 10) * 10 + i
            let two = (now / 100) * 100 + i * 10 + now % 10
            let three = (now / 1000) * 1000 + i * 100 + now % 100
            let four = i * 1000 + now % 1000
            if isPrime[one] && !visited[one] {
                queue.append((one, value + 1))
            }
            if isPrime[two] && !visited[two] {
                queue.append((two, value + 1))
            }
            if isPrime[three] && !visited[three] {
                queue.append((three, value + 1))
            }
            if i != 0 && isPrime[four] && !visited[four] {
                queue.append((four, value + 1))
            }
        }
    }
}
