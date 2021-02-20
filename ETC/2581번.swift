// 출처 : 백준 소수
// https://www.acmicpc.net/problem/2581
// 풀이 : hogumachu

import Foundation

let inputOne = Int(readLine()!)!
let inputTwo = Int(readLine()!)!

var result = 0
var min = 0

for num in inputOne...inputTwo {
    var count = 3
    var prime = true
    if num == 1 {

    } else if num == 2 {
        result += num
        min = 2
    } else if num == 3 {
        result += num
        if min == 0 {
            min = 3
        }
    } else {
        if num % 2 == 0 || num % 3 == 0 {
        } else {
            while num / count >= 2 {
                if num % count == 0 {
                    prime = false
                    break
                } else {
                    count += 2
                }
            }
            if prime == true {
                if min == 0 {
                    min = num

                }
                result += num

            }
        }
    }
}

if result == 0 {
    print(-1)
} else {
    print(result)
    print(min)
}
