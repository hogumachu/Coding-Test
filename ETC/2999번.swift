// 출처 : 백준 비밀 이메일
// https://www.acmicpc.net/problem/2999
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!
    var message: [Character] = []
    for value in input {
        message.append(value)
    }
    let n = message.count
    var r = 1
    var c = n
    var count = 0
    var result = ""
    for i in 2...n {
        if i > n / i {
            break
        }
        if n % i == 0 {
            r = i
            c = n / i
        }
    }
    var table: [[String]] = Array(repeating: Array(repeating: "", count: c), count: r)

    for i in 0..<c {
        for j in 0..<r {
            table[j][i] = "\(message[count])"
            count += 1
        }
    }
    for i in table {
        for j in i {
            result += "\(j)"
        }
    }
    print(result)
}

solution()
