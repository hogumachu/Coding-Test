// 출처 : 백준 그리디 알고리즘 설탕 배달
// https://www.acmicpc.net/problem/2839
// 풀이 : hogumachu

import Foundation

let input: Int = Int(readLine()!)!

var three: Int = 0
var five: Int = input / 5
var count: Int = 0
var result: Int = 0

while true {
    if three <= -1 || five <= -1 {
        result = -1
        break
    }
    if (three * 3) + (five * 5) == input {
        result = three + five
        break
    } else if (three * 3) + (five * 5) < input {
        three += 1
    } else if (three * 3) + (five * 5) > input {
        five -= 1
        three += 1
    }
    if count > 20 {
        result = -1
        break
    }
    count += 1
}

print(result)
