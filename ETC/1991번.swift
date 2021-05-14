// 출처 : 백준 트리 순회
// https://www.acmicpc.net/problem/1991
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: [0, 0], count: n)
    var visited: [Bool] = Array(repeating: false, count: n)
    var preorderResult = ""
    var inorderResult = ""
    var postorderResult = ""
    for _ in 0..<n {
        let value = readLine()!.split(separator: " ").map{Character(String($0))}
        value[1] == "." ? nil : (table[Int(value[0].asciiValue!)-65][0] = Int(value[1].asciiValue!)-65)
        value[2] == "." ? nil : (table[Int(value[0].asciiValue!)-65][1] = Int(value[2].asciiValue!)-65)
    }

    func order(_ node: Int) -> Void {
        if visited[node] == false {
            visited[node] = true
            preorderResult += "\(String(UnicodeScalar(UInt8(node + 65))))"
            if table[node][0] != 0 {
                order(table[node][0])
            }
            inorderResult += "\(String(UnicodeScalar(UInt8(node + 65))))"
            if table[node][1] != 0 {
                order(table[node][1])
            }
            postorderResult += "\(String(UnicodeScalar(UInt8(node + 65))))"
        }
    }

    order(0)
    visited = Array(repeating: false, count: n)

    print(preorderResult)
    print(inorderResult)
    print(postorderResult)
}

solution()
