// 출처 : 백준 파티
// https://www.acmicpc.net/problem/1238
// 풀이 : hogumachu

let nmx = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmx[0], m = nmx[1], x = nmx[2]
let v = Array(repeating: false, count: n + 1)
let w = Array(repeating: 1_000 * 10_001, count: n + 1)
var graph: [[(Int, Int)]] = Array(repeating: [], count: n + 1)
var result = 0
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[input[0]].append((input[1], input[2]))
}

for i in 1...n {
    if i != x {
        let value = visit(i, x) + visit(x, i)
        result = result > value ? result : visit(i, x) + visit(x, i)
    }
}
print(result)

func visit(_ start: Int, _ destination: Int) -> Int {
    var queue = Queue<(Int, Int)>(compare: {$0.1 > $1.1})
    var visited = v
    var weight = w
    weight[start] = 0
    queue.push((start, 0))
    while let now = queue.pop() {
        if now.0 == destination {
            return weight[destination]
        }
        visited[now.0] = true

        graph[now.0].filter { !visited[$0.0] }
            .forEach { index, value in
                if weight[index] > now.1 + value {
                    weight[index] = now.1 + value
                    queue.push((index, weight[index]))
                }
            }

    }
    return -1000000
}

struct Queue<T> {
    private let compare: (T, T) -> Bool
    private var arr = Array<T>()

    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    mutating func push(_ value: T) {
        arr.append(value)
        bottomSort()
    }

    mutating func pop() -> T? {
        if !arr.isEmpty {
            arr.swapAt(0, arr.count - 1)
            let popValue = arr.removeLast()
            topSort()
            return popValue
        } else {
            return nil
        }
    }

    mutating func topSort() {
        var index = 0

        while index * 2 + 1 < arr.count {
            var i = index * 2 + 1
            if i + 1 < arr.count && compare(arr[i], arr[i + 1]) {
                i += 1
            }
            if !compare(arr[index], arr[i]) {
                break
            }
            arr.swapAt(index, i)
            index = i
        }
    }

    mutating func bottomSort() {
        var index = arr.count - 1

        while index > 0 && compare(arr[(index - 1) / 2], arr[index]) {
            arr.swapAt((index - 1) / 2, index)
            index = (index - 1) / 2
        }
    }

}
