// 출처 : 백준 ROT13
// https://www.acmicpc.net/problem/11655
// 풀이 : hogumachu

import Foundation

let input = readLine()!

var result = ""

for i in input {
    var rot13 = i.asciiValue!

    if i.asciiValue! >= 97 && i.asciiValue! <= 122 {
        rot13 += 13
        if rot13 > 122 {
            rot13 -= 26
        }
    } else if i.asciiValue! >= 65 && i.asciiValue! <= 90 {
        rot13 += 13
        if rot13 > 90 {
            rot13 -= 26
        }
    }
    result += "\(UnicodeScalar(rot13))"
}
print(result)
