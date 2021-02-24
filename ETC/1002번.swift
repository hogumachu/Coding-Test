// 출처 : 백준 터렛
// https://www.acmicpc.net/problem/1002
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var result = [Int]()

for _ in 1...input {
    let value = readLine()!.split(separator: " ").map{Double(String($0))!}
    let x1 = value[0]
    let y1 = value[1]
    let r1 = value[2]
    let x2 = value[3]
    let y2 = value[4]
    let r2 = value[5]
    if x1 == x2, y1 == y2 {
        if r1 == r2 {
            result.append(-1)
        } else {
            result.append(0)
        }
    } else {
        let distance = (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2)
        let minus = (r1 - r2) * (r1 - r2)
        let plus = (r1 + r2) * (r1 + r2)
        if distance > minus, distance < plus {
            result.append(2)
        } else if distance == plus {
            result.append(1)
        } else if distance == minus, distance != 0 {
            result.append(1)
        } else if distance > plus {
            result.append(0)
        } else if distance < minus {
            result.append(0)
        }

    }
}

for value in result {
    print(value)
}
