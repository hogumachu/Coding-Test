// 출처 : 백준 색종이 만들기
// https://www.acmicpc.net/problem/2630
// 풀이 : hogumachu


import Foundation

let input = Int(readLine()!)!

var array: [[Int]] = Array(repeating: Array(repeating: 0, count: input), count: input)

var result = 0
var cut = 0
for i in 0..<input {
    let inputArray = readLine()!.split(separator: " ").map{Int(String($0))!}

    var j = 0
    for k in inputArray {
        array[i][j] = k
        j += 1
    }
}

func recursive(_ array: [[Int]]) -> Void {
    let x = array.count
    let y = array.count
    var sum = 0

    for i in 0..<x {
        sum += array[i].reduce(0, +)
    }

    if sum == 0 {
        if array.count != 0 {
            cut += 1
        }
    } else if sum == x*y {
        result += 1
    } else {
        var array1 = Array(repeating: Array(repeating: 0, count: x/2), count: y/2)
        var array2 = Array(repeating: Array(repeating: 0, count: x/2), count: y/2)
        var array3 = Array(repeating: Array(repeating: 0, count: x/2), count: y/2)
        var array4 = Array(repeating: Array(repeating: 0, count: x/2), count: y/2)

        for i in 0..<x/2 {
            for j in 0..<y/2 {
                array1[i][j] = array[i][j]
                array2[i][j] = array[i][j+y/2]
                array3[i][j] = array[i+x/2][j]
                array4[i][j] = array[i+x/2][j+y/2]
            }
        }
        recursive(array1)
        recursive(array2)
        recursive(array3)
        recursive(array4)
    }

}

recursive(array)
print(cut)
print(result)
