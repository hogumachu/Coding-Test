// 출처 : 백준 영화감독 숌
// https://www.acmicpc.net/problem/1436
// 풀이 : hogumachu

import Foundation

var N = Int(readLine()!)!
var result = 665

func tripleSix( _ num: Int) -> Bool {
    var divNum = num
    if num == 666 {
        return true
    } else {
        while divNum > 100 {
            if divNum % 10 == 6, (divNum/10) % 10 == 6, ((divNum/10)/10) % 10 == 6 {
                return true
            } else {
                divNum /= 10
            }
        }
    }
    return false

}
while N != 0 {
    result += 1
    if tripleSix(result) {
        N -= 1
    }

}

print(result)
