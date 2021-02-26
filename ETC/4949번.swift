// 출처 : 백준 균형잡힌 세상
// https://www.acmicpc.net/problem/4949
// 풀이 : hogumachu

import Foundation

var value = ""

while true {
    let input = readLine()!
    if input == "." {
        break
    } else {
        value += input
    }

}

var sentences = value.split(separator: ".")


for sentence in sentences {
    var value: [Character] = []
    var result = "yes"
    for word in sentence {
        if word == "(" {
            value.append(word)
        } else if word == "[" {
            value.append(word)
        } else if word == ")" {
            if value.last == "(" {
                value.removeLast()
            } else {
                result = "no"
                break
            }
        } else if word == "]" {
            if value.last == "[" {
                value.removeLast()
            } else {
                result = "no"
                break
            }
        }
    }
    if value.count != 0 {
        result = "no"
    }
    print(result)
}
