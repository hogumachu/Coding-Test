// 출처 : 백준 ACM Craft
// https://www.acmicpc.net/problem/1005
// 풀이 : hogumachu
// 로직은 맞았는데 readLine이 시간이 오래 걸려 시간 초과가 나왔었음 ;;

import Foundation

let fIO = FileIO()
let TC = fIO.readInt()
(0..<TC).forEach({ _ in
    let (n,k) = (fIO.readInt(), fIO.readInt())
    var weights: [Int] = []
    for _ in 0..<n {
        weights.append(fIO.readInt())
    }
    var graph: [[Int]] = Array(repeating: [], count: n + 1)
    var must: [[Int]] = Array(repeating: [], count: n + 1)
    var visited: [Bool] = Array(repeating: false, count: n + 1)
    var result = Array(repeating: 0, count: n + 1)
    var queue: [Int] = []
    var queueIndex = 0
    (0..<k).forEach({ _ in
        let (a, b) = (fIO.readInt(), fIO.readInt())
        graph[a].append(b)
        must[b].append(a)
    })
    let destination = fIO.readInt()
    for i in 1...n {
        if must[i].isEmpty {
            result[i] = weights[i-1]
            queue.append(i)
        }
    }
    while queue.count > queueIndex {
        let select = queue[queueIndex]
        queueIndex += 1
        visit(select)
    }
    print(result[destination])
    func visit(_ now: Int) {
        if now == destination || visited[now] {
            return
        }
        for i in must[now] {
            if !visited[i] {
                return
            }
        }
        visited[now] = true
        for i in graph[now] {
            result[i] = max(result[i], result[now] + weights[i-1])
            if !visited[i] {
                queue.append(i)
            }
        }
    }
})


final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}
