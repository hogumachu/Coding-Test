// 출처 : 백준 단어 뒤집기 2
// https://www.acmicpc.net/problem/17413
// 풀이 : hogumachu

import Foundation

let input = readLine()!

var flipValue: String = ""
var result: String = ""
var flip: Bool = true
for i in input {
    if i == "<" {
        flip = false
        result += flipValue.reversed()
        flipValue = ""
        result += "\(i)"
    } else if i == ">" {
        flip = true
        result += "\(i)"
    } else {
        if flip == true {
            if i == " " {
                result += flipValue.reversed() + " "
                flipValue = ""
            } else {
                flipValue += "\(i)"
            }
        } else {
            result += "\(i)"
        }
    }
}
if flipValue != "" {
    result += flipValue.reversed()
}
print(result)
