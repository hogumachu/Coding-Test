// 출처 : 백준 단어 공부
// https://www.acmicpc.net/problem/1157
// 풀이 : hogumachu

import Foundation

let input = readLine()!

var value = [String:Int]()

for i in input {
    var camel: String = "\(i)"
    if i.asciiValue! >= 97 && i.asciiValue! <= 122 {
        camel = String(UnicodeScalar(i.asciiValue! - 32))
    }
    if value[camel] == nil {
        value[camel] = 0
    } else {
        value[camel]! += 1
    }
}

var result = value.sorted(by: {$0.1 > $1.1})

var sol: Int = 0
var solString: String = ""

if result.count == 1 {
    print("\(result.first!.key)")
} else {
    for i in result {
        if i.value > sol {
            sol = i.value
            solString = "\(i.key)"
        } else if i.value < sol {
            print(solString)
            break
        } else if i.value == sol {
            print("?")
            break
        }
    }

}
