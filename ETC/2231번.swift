// 출처 : 백준 분해합
// https://www.acmicpc.net/problem/2231
// 풀이 : hogumachu


import Foundation

let input = Int(readLine()!)!
var haveResult = false
for num in input/2...input {
    var value: [Int] = []
    var count = num
    var result = num

    while count > 0 {
        result += count % 10
        count /= 10
    }

    if result == input {
        print(num)
        haveResult = true
        break
    }
}

if haveResult == false {
    print(0)
}
