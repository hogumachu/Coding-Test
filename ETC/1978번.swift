// 출처 : 백준 소수 찾기
// https://www.acmicpc.net/problem/1978
// 풀이 : hogumachu

import Foundation

let _ = readLine()!

let input = readLine()!.split(separator: " ").map{Int($0)!}

var result = 0

for num in input {
    var count = 3
    var prime = true
    if num == 1 {

    } else if num == 2 || num == 3{
        result += 1
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
                result += 1
            }
        }
    }
}

print(result)
