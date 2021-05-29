// 출처 : 백준 줄어들지 않아
// https://www.acmicpc.net/problem/2688
// 풀이 : hogumachu

import Foundation

func solution() {
    let t = Int(readLine()!)!
    var result: [Int] = []
    var table:[[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 1001)
    for i in 0...9 {
        table[1][i] = 1
    }
    for _ in 0..<t {
        let n = Int(readLine()!)!
        if n != 1 && table[n][0] == 0 {
            for i in 2...n {
                if table[i][0] != 0 {
                    continue
                } else {
                    table[i][0] = table[i-1].reduce(0, +)
                    for j in 1...9 {
                        table[i][j] = table[i][j-1] - table[i-1][j-1]
                    }
                }
            }
        }
        result.append(table[n].reduce(0, +))
    }
    for value in result {
        print(value)
    }
}

solution()

// 0 = n[1][0] = 1
// 1 = n[1][1] = 1
// 2 = n[1][2] = 1
// 3 = n[1][3] = 1
// 4 = n[1][4] = 1
// 5 = n[1][5] = 1
// 6 = n[1][6] = 1
// 7 = n[1][7] = 1
// 8 = n[1][8] = 1
// 9 = n[1][9] = 1


// 00 ~ 09 (10) = n[2][0] = n[1].sum
// 11 ~ 19 (9) = n[2][1] = n[1].sum - n[1][0]
// 22 ~ 29 (8) = n[2][2] = n[1].sum - n[1][0] - n[1][1]
// 33 ~ 39 (7) = n[2][3]
// 44 ~ 49 (6) = n[2][4]
// 55 ~ 59 (5) = n[2][5]
// 66 ~ 69 (4) = n[2][6]
// 77 ~ 79 (3) = n[2][7]
// 88 ~ 89 (2) = n[2][8]
// 99 ~ 99 (1) = n[2][9] = n[1].sum - n[1][0] - n[1][1] - n[1][2] - n[1][3] ... n[1][9]

// 000 ~ 099 n(2) = 55 = n[3][0] = n[2].sum
// 111 ~ 199 n(2) - 10 = n[3][1] = n[2].sum - n[2][0]
// 222 ~ 299 n(2) - 10 - 9
// 333 ~ 399 n(2) - 10 - 9 - 8
// ....
// 999 ~ 999 n(2) - 10 - 9 - 8 - 7 - 6 - 5 - 4 - 3 - 2

// n(2) * 10 - (10*9 +



// 0000 ~ 0999 n(3)
// 1111 ~ 1999 n(3) - n(2)

// n = 1 -> 10
// n = 2 -> n(1)*10 - (1*9 +  1*8 +  7 + 6 + 5 + 4 + 3 + 2 + 1)
// n = 3 -> n(2) * 10 - (10*9 + 9*8 + ... 3*2 + 2*1)
