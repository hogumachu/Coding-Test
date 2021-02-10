// 출처 : 백준 최대공약수와 최소공배수
// https://www.acmicpc.net/problem/2609
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
var value = input.sorted(by: >)
var gcd = 1
var div = 2

while true {
    if value[1] < div {
        break
    }
    else if value[0] % div == 0 && value[1] % div == 0 {
        gcd *= div
        value[0] /= div
        value[1] /= div
    } else {
        div += 1
    }
}

print(gcd)
print(input[0] * input[1] / gcd)
