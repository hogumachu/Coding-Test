// 출처 : HackerRank Electronics Shop
// https://www.hackerrank.com/challenges/electronics-shop/problem
// 풀이 : hogumachu

import Foundation

let bnm = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let b = bnm[0]
let keyboards = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let drives = readLine()!.split { $0 == " " }.map { Int(String($0))! }

var result = -1

for keyboard in keyboards {
    for drive in drives {
        if keyboard + drive <= b {
            result = max(result, keyboard + drive)
        }
    }
}
print(result)
