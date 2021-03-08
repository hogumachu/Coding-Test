// 출처 : 백준 팩토리얼 0의 개수
// https://www.acmicpc.net/problem/1676
// 풀이 : hogumachu

import Foundation

let n = Int(readLine()!)!

var two = 0, five = 0
var i = 2, j = 5

while i <= n {
    two += n / i
    i *= 2
}


while j <= n {
    five += n / j
    j *= 5
}

if two < five {
    print(two)
} else {
    print(five)
}
