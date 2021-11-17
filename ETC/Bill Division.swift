// 출처 : HackerRank Bill Division
// https://www.hackerrank.com/challenges/bon-appetit/problem
// 풀이 : hogumachu

import Foundation

let nk = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let bill = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let charged = Int(readLine()!)!
let result = ((bill.reduce(0, +) - bill[nk[1]]) / 2) - charged

print(result == 0 ? "Bon Appetit" : abs(result))
