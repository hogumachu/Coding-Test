// 출처 : 백준 종이의 개수
// https://www.acmicpc.net/problem/1780
// 풀이 : hogumachu


import Foundation

let n = Int(readLine()!)!

var papers: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
var minusOne = 0, zero = 0, one = 0
for i in 0..<n {
    papers[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

func solution( _ length: Int, _ x: Int, _ y: Int) -> Void{
    var sum = 0
    var notZero = false
    for i in x..<x+length {
        for j in y..<y+length {
            sum += papers[i][j]
            if papers[i][j] != 0 {
                notZero = true
            }
        }
    }
    if sum == length * length {
        one += 1
    } else if sum == -1 * length * length {
        minusOne += 1
    } else if sum == 0, notZero == false {
        zero += 1
    } else {
        let divLength = length / 3
        solution(divLength, x, y) // 0 0
        solution(divLength, x, y + divLength) // 0 3
        solution(divLength, x, y + 2 * divLength) // 0 6
        solution(divLength, x + divLength, y) // 3 0
        solution(divLength, x + divLength, y + divLength) // 3 3
        solution(divLength, x + divLength, y + 2 * divLength) // 3 6
        solution(divLength, x + 2 * divLength, y) // 6 0
        solution(divLength, x + 2 * divLength, y + divLength) // 6 3
        solution(divLength, x + 2 * divLength, y + 2 * divLength) // 6 6
    }
}

solution(n, 0, 0)

print(minusOne)
print(zero)
print(one)
