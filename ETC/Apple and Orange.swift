// 출처 : HackerRank Apple and Orange
// https://www.hackerrank.com/challenges/apple-and-orange/problem
// 풀이 : hogumachu

import Foundation

let st = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let ab = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let s = st[0], t = st[1], a = ab[0], b = ab[1]

let _ = readLine()!.split { $0 == " " }.map { Int(String($0))! }

let apple = readLine()!
    .split { $0 == " " }
    .map { Int(String($0))! + a }
    .filter { $0 >= s && $0 <= t }
    .count

let orange = readLine()!
    .split { $0 == " " }
    .map { Int(String($0))! + b }
    .filter { $0 >= s && $0 <= t }
    .count

print(apple)
print(orange)
