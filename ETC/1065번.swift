// 출처 : 백준 한수
// https://www.acmicpc.net/problem/1065
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var result = input
var count = 100

if input > 99 {
    result = 99
    while count != input + 1{
        var trueBreak = false
        var divCount = count
        var compare = divCount % 10
        divCount /= 10
        compare -= divCount % 10
        var compare2 = divCount % 10
        while divCount != 0 {
            divCount /= 10
            compare2 -= divCount % 10


            if compare != compare2 {

                trueBreak = true
                break
            }
        }
        if trueBreak == false {
            result += 1
        }
        count += 1
    }
}

print(result)
