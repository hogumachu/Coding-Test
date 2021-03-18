// 출처 : 백준 전자레인지
// https://www.acmicpc.net/problem/10162
// 풀이 : hogumachu
// 간단한 문제

import Foundation

func solution() -> Void {
    var t = Int(readLine()!)!
    let a = 300, b = 60, c = 10
    var result: [Int] = [0, 0, 0]

    result[0] = t / a
    if result[0] != 0 {
        t %= (a * result[0])
    }

    result[1] = t / b
    if result[1] != 0 {
        t %= (b * result[1])
    }

    result[2] = t / c
    if result[2] != 0 {
        t %= (c * result[2])
    }
    if t == 0 {
        var resultString = ""
        for i in result {
            resultString += "\(i) "
        }
        print(resultString)
    } else {
        print(-1)
    }

}

solution()
