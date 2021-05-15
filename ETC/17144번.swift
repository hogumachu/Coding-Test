// 출처 : 백준 미세먼지 안녕!
// https://www.acmicpc.net/problem/17144
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let r = input[0], c = input[1], t = input[2]
    var table: [[Int]] = Array(repeating: [], count: r)
    var saveTable: [[Int]] = Array(repeating: Array(repeating: 0, count: c), count: r)
    var k = 0
    var countT = 0
    var result = 0
    for i in 0..<r {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
        if table[i][0] == -1 && k == 0 {
            k = i
        }
    }

    func spread(_ x: Int, _ y: Int) -> Void {
        let divValue = table[x][y] / 5
        var count = 0
        if x-1 >= 0 {
            if table[x-1][y] != -1 {
                saveTable[x-1][y] += divValue
                count += 1
            }
        }
        if x+1 < r{
            if table[x+1][y] != -1 {
                saveTable[x+1][y] += divValue
                count += 1
            }
        }
        if y-1 >= 0 {
            if table[x][y-1] != -1 {
                saveTable[x][y-1] += divValue
                count += 1
            }
        }
        if y+1 < c {
            if table[x][y+1] != -1 {
                saveTable[x][y+1] += divValue
                count += 1
            }
        }
        saveTable[x][y] += table[x][y] - divValue * count
    }

    func airCleaner(_ k: Int) -> Void {
        for i in 0..<k-1 {
            table[k-1-i][0] = table[k-2-i][0]
        }

        table[0][0...c-2] = table[0][1...c-1]

        for i in 0..<k {
            table[i][c-1] = table[i+1][c-1]
        }

        table[k][2...c-1] = table[k][1...c-2]
        table[k][1] = 0

        for i in k+2...r-1 {
            table[i-1][0] = table[i][0]
        }
        table[r-1][0...c-2] = table[r-1][1...c-1]

        for i in k+1...r-2 {
            table[r-1+k+1-i][c-1] = table[r-1+k+1-i-1][c-1]
        }
        table[k+1][2...c-1] = table[k+1][1...c-2]
        table[k+1][1] = 0

        table[k][0] = -1
        table[k+1][0] = -1
    }

    while t > countT {
        countT += 1
        for i in 0..<r {
            for j in 0..<c {
                if table[i][j] != 0 && table[i][j] != -1 {
                    spread(i, j)
                }
            }
        }

        table = saveTable
        airCleaner(k)
        saveTable = Array(repeating: Array(repeating: 0, count: c), count: r)

    }

    for i in table {
        result += i.reduce(0, +)
    }
    result += 2
    print(result)
}

solution()
