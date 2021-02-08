// 출처 : 백준 에디터
// https://www.acmicpc.net/problem/1406
// 풀이 : hogumachu

import Foundation

let inputString: String = readLine()!
var inputStringArray = inputString.map{ $0 }
let inputNum: Int = Int(readLine()!)!
var cursor: Int = inputStringArray.count

for _ in 0..<inputNum {
    let order: String = readLine()!
    switch order {
    case "L":
        if cursor > 0 {
            cursor -= 1
        }
    case "D":
        if cursor < inputStringArray.count {
            cursor += 1
        }
    case "B":
        if cursor == 0 {

        } else {
            inputStringArray.remove(at: cursor - 1)
            cursor -= 1
        }
    default:
        let str = order.split(separator: " ")
        inputStringArray.insert(contentsOf: "\(str[1])", at: cursor)
        cursor += 1
    }
}

var result = inputStringArray.reduce("", {String($0) + String($1)})
print(result)
