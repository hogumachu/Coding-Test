// 출처 : 백준 테트로미노
// https://www.acmicpc.net/problem/14500
// 풀이 : hogumachu
// 한번에 갈 수 있는 경우 dp로 풀고 그 외 ㅗ 모양은 예외 케이스로 하여 풀었음

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], m = input[1]
    var table: [[Int]] = Array(repeating: [], count: n)
    var result = 0
    for i in 0..<n {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }

    func dp(_ x: Int, _ y :Int, _ before: Int, _ counting: Int, _ sum: Int) -> Void {
        // before = 1 -> 위로 가기 금지
        // before = 2 -> 아래로 가기 금지
        // before = 3 -> 왼쪽으로 가기 금지
        // before = 4 -> 오른쪽으로 가기 금지
        if counting == 4 {
            if result < sum {
                result = sum
            }
            return
        }

        if x-1 >= 0 && before != 1 {
            dp(x-1, y, 2, counting+1, sum+table[x-1][y])
        }

        if x+1 < n && before != 2 {
            dp(x+1, y, 1, counting+1, sum+table[x+1][y])
        }

        if y-1 >= 0 && before != 3 {
            dp(x, y-1, 4, counting+1, sum+table[x][y-1])
        }

        if y+1 < m && before != 4 {
            dp(x, y+1, 3, counting+1, sum+table[x][y+1])
        }
    }

    func elseDp(_ x: Int, _ y: Int) -> Void {
        // ㅗ ㅜ ㅏ ㅓ 는 dp가 예외이므로 따로 구현

        // ㅗ  ㅜ
        if x+1 < n && y-1 >= 0 && y+1 < m {
            if result < table[x][y] + table[x+1][y-1] + table[x+1][y] + table[x+1][y+1] {
                result = table[x][y] + table[x+1][y-1] + table[x+1][y] + table[x+1][y+1]
            }
            if result < table[x][y] + table[x][y-1] + table[x+1][y] + table[x][y+1] {
                result = table[x][y] + table[x][y-1] + table[x+1][y] + table[x][y+1]
            }
        }

        // ㅏ ㅓ
        if x+2 < n && y+1 < m {
            if result < table[x][y] + table[x+1][y] + table[x+1][y+1] + table[x+2][y] {
                result = table[x][y] + table[x+1][y] + table[x+1][y+1] + table[x+2][y]
            }
            if result < table[x+1][y] + table[x][y+1] + table[x+1][y+1] + table[x+2][y+1] {
                result = table[x+1][y] + table[x][y+1] + table[x+1][y+1] + table[x+2][y+1]
            }
        }
    }

    for i in 0..<n {
        for j in 0..<m {
            dp(i, j, 0, 1, table[i][j])
            elseDp(i, j)
        }
    }
    print(result)
}

solution()
