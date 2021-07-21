// 출처 : 백준 수 정렬하기 3
// https://www.acmicpc.net/problem/10989
// 풀이 : hogumachu
// 입출력의 크기를 잘 확인하자

import Foundation

let file = FileIO()

let n = file.readInt()
var values: [Int] = Array(repeating: 0, count: 10_001)
var result = ""

for _ in 0..<n {
    values[file.readInt()] += 1
}

for i in 1...10_000 where values[i] > 0{
    result += String(repeating: "\(i)\n", count: values[i])
}
print(result)

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
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
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
                || now == 32 { now = read() }

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}
