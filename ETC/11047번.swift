// 출처 : 백준 그리디 알고리즘 동전 0
// https://www.acmicpc.net/problem/11047
// 풀이 : hogumachu

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let n = input[0]
var money = input[1]
var coins: [Int] = []
var result: Int = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}
coins.reverse()

for i in coins {
    if i <= money {
        result += money / i
        money = money % i
    }
    if money == 0 {
        break
    }
}
print(result)
