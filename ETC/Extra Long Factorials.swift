// 출처 : HackerRank Extra Long Factorials
// https://www.hackerrank.com/challenges/extra-long-factorials/problem
// 풀이 : hogumachu

import Foundation

let n = Int(readLine()!)!
var result = "1"

func mult(_ now: String, _ num: Int) -> String {
    var arr = now.map { Int(String($0))! }
    arr.reverse()
    var result = Array(repeating: 0, count: arr.count)

    var k = num
    var scale = 0

    while k != 0 {
        let m = k % 10

        if m != 0 {
            for i in 0..<arr.count {
                var value = arr[i] * m
                var cursor = i + scale

                while value != 0 {
                    if cursor < result.count {
                        result[cursor] += value % 10
                    } else {
                        result.append(value % 10)
                    }

                    value /= 10
                    cursor += 1
                }
            }

        }

        k /= 10
        scale += 1
    }

    var cursor = 0

    while cursor < result.count {
        if result[cursor] >= 10 {
            let tmp = result[cursor] / 10
            result[cursor] %= 10

            if cursor + 1 < result.count {
                result[cursor + 1] += tmp
            } else {
                result.append(tmp)
            }
        }

        cursor += 1
    }

    return result.reversed().reduce("", { String($0) + String($1) })
}

for i in 1...n {
    result = mult(result, i)
}

print(result)
