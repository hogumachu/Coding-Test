// 출처 : HackerRank Forming a Magic Square
// https://www.hackerrank.com/challenges/magic-square-forming/problem
// 풀이 : hogumachu

import Foundation

func solution(magicSquare: [[Int]], arr: [Int]) -> Int {
    var result = Int.max

    for square in magicSquare {
        var compare = 0

        for i in 0..<arr.count {
            compare += abs(arr[i] - square[i])
        }

        result = min(compare, result)
    }

    return result
}

var arr: [Int] = []

for _ in 0..<3 {
    let value = readLine()!.split { $0 == " " }.map { Int(String($0))! }
    arr.append(contentsOf: value)
}

let magicSquare = [
    [2, 7, 6, 9, 5, 1, 4, 3, 8],
    [4, 9, 2, 3, 5, 7, 8, 1, 6],
    [8, 3, 4, 1, 5, 9, 6, 7, 2],
    [6, 1, 8, 7, 5, 3, 2, 9, 4],
    [2, 9, 4, 7, 5, 3, 6, 1, 8],
    [6, 7, 2, 1, 5, 9, 8, 3, 4],
    [8, 1, 6, 3, 5, 7, 4, 9, 2],
    [4, 3, 8, 9, 5, 1, 2, 7, 6]
]

print(solution(magicSquare: magicSquare, arr: arr))
