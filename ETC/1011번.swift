// 출처 : 백준 Fly me to the Alpha Centauri
// https://www.acmicpc.net/problem/1011
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!
var values = [Int]()
for _ in 1...input {
    let v = readLine()!.split(separator: " ").map{Int(String($0))!}
    values.append(v[1] - v[0])
}

for value in values {
    var root = Int(sqrt(Double(value)))

    while true {
        if root * root == value {
            print((root * 2) - 1)
            break
        } else if value > root * root, value <= root * root + root {
            print(root * 2)
            break
        } else if value > root * root + root, value <= (root + 1) * (root + 1){
            print((root + 1) * 2 - 1)
            break
        } else {
            root += 1
        }
    }
}
