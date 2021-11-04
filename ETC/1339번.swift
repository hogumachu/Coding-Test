// 출처 : 백준 단어 수학
// https://www.acmicpc.net/problem/1339
// 풀이 : hogumachu

import Foundation

var dic: [String: Int] = [:]
var mult = 9
var result = 0
for _ in 0..<Int(readLine()!)! {
    var alpha = readLine()!.map { String($0) }
    alpha.reverse()

    for i in 0..<alpha.count {
        if dic[alpha[i]] == nil {
            dic[alpha[i]] = Int(truncating: NSDecimalNumber(decimal: pow(10, i)))
        } else {
            dic[alpha[i]]! += Int(truncating: NSDecimalNumber(decimal: pow(10, i)))
        }
    }
}

for (_, value) in dic.sorted(by: {$0.value > $1.value}){
    result += (value * mult)
    mult -= 1
}

print(result)
