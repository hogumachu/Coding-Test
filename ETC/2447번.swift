// 출처 : 백준 별찍기 - 10
// https://www.acmicpc.net/problem/2447
// 풀이 : hogumachu

import Foundation

let input = Int(readLine()!)!

var star: [[Character]] = Array(repeating: Array(repeating: "*", count: input), count: input)

func deleteStar(_ x: Int, _ y: Int, _ num: Int) -> Void {
    if num < 3 {
        return
    }
    for i in x-2*(num/3)..<x-(num/3) {
        for j in y-2*(num/3)..<y-(num/3) {
            star[i][j] = " "
        }
    }
    deleteStar(x-(2*num/3), y-(2*num/3), num/3)
    deleteStar(x-(2*num/3), y-(num/3), num/3)
    deleteStar(x-(2*num/3), y, num/3)
    deleteStar(x-(num/3), y-(2*num/3), num/3)
    deleteStar(x-(num/3), y, num/3)
    deleteStar(x, y-(2*num/3), num/3)
    deleteStar(x, y-(num/3), num/3)
    deleteStar(x, y, num/3)
}
deleteStar(input, input, input)
for i in 0..<input {
    var str = ""
    for j in 0..<input {
        str += "\(star[i][j])"
    }
    print(str)
}
