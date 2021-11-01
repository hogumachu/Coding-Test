// 출처 : HackerRank Number Line Jumps
// https://www.hackerrank.com/challenges/kangaroo/problem
// 풀이 : hogumachu

// v1 * t + x1 = v2 * t + x2
// t = ( x2 - x1 ) / ( v1 - v2 )
// v1 * t + x1 = k
// k = integer && k >= x1 && k >= x2


import Foundation

let xvs = readLine()!.split { $0 == " " }.map { Int(String($0))! }
let x1 = xvs[0], v1 = xvs[1], x2 = xvs[2], v2 = xvs[3]
var result = false

if v1 == v2 {
    if x1 % 2 == x2 % 2 {
        result = true
    }
} else {
    if (x2 - x1) % (v1 - v2) == 0 && (v1 - v2) <= (x2 - x1) {
        let t = (x2 - x1) / (v1 - v2)
        let k = v1 * t + x1

        if k >= max(x1, x2) {
            result = true
        }
    }
}

print(result ? "YES" : "NO")
