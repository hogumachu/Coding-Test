// 출처 : 백준 파이프 옮기기 1
// https://www.acmicpc.net/problem/17070
// 풀이 : hogumachu

import Foundation

func solution() {
    let n = Int(readLine()!)!
    var table: [[Int]] = Array(repeating: [], count: n)
    var result = 0
    for i in 0..<n {
        table[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }

    func move(_ x: Int, _ y: Int, _ mode: Int) -> Void {
        // 1 = 가로, 2 = 세로, 3 = 대각선
        if x == n-1 && y == n-1 {
            result += 1
            return
        }
        if mode == 1 {
            if y+1 < n {
                if table[x][y+1] != 1 {
                    move(x, y+1, 1)
                }
                if x+1 < n {
                    if table[x][y+1] != 1 && table[x+1][y+1] != 1 && table[x+1][y] != 1 {
                        move(x+1, y+1, 3)
                    }
                }
            }

        } else if mode == 2{
            if x+1 < n {
                if table[x+1][y] != 1 {
                    move(x+1, y, 2)
                }
                if y+1 < n {
                    if table[x][y+1] != 1 && table[x+1][y+1] != 1 && table[x+1][y] != 1 {
                        move(x+1, y+1, 3)
                    }
                }
            }
        } else {
            if y+1 < n {
                if table[x][y+1] != 1 {
                    move(x, y+1, 1)
                }
                if x+1 < n {
                    if table[x][y+1] != 1 && table[x+1][y+1] != 1 && table[x+1][y] != 1 {
                        move(x+1, y+1, 3)
                    }
                }
            }
            if x+1 < n {
                if table[x+1][y] != 1 {
                    move(x+1, y, 2)
                }
            }
        }
    }
    move(0, 1, 1)

    print(result)

}


solution()
