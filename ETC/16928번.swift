// 출처 : 백준 뱀과 사다리 게임
// https://www.acmicpc.net/problem/16928
// 풀이 : hogumachu
// 뱀과 사다리를 반드시 탔어야함
// 뱀과 사다리가 있는 위치에서는 주사위를 굴릴 수 없고 탄 후에 굴려야 함

import Foundation

func solution() {
    var table: [(Int, Int)] = Array(repeating: (100000,101), count: 102)
    var queue: [Int]  = []
    var index = 0
    table[1].0 = 0
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}

    for _ in 0..<input[0]+input[1] {
        let value = readLine()!.split(separator: " ").map{Int(String($0))!}
        table[value[0]].1 = value[1]
    }
    queue.append(1)
    while true {
        let select = queue[index]
        if select == 100 {
            break
        }
        index += 1
        if table[select].1 != 101 {
            if table[select].0 < table[table[select].1].0 {
                table[table[select].1].0 = table[select].0
            }
            queue.append(table[select].1)
        } else {
            if select + 1 <= 100 {
                if table[select].0 + 1 < table[select+1].0 {
                    table[select+1].0 = table[select].0 + 1
                    queue.append(select+1)
                }
            }
            if select + 2 <= 100 {
                if table[select].0 + 1 < table[select+2].0 {
                    table[select+2].0 = table[select].0 + 1
                    queue.append(select+2)
                }
            }
            if select + 3 <= 100 {
                if table[select].0 + 1 < table[select+3].0 {
                    table[select+3].0 = table[select].0 + 1
                    queue.append(select+3)
                }
            }
            if select + 4 <= 100 {
                if table[select].0 + 1 < table[select+4].0 {
                    table[select+4].0 = table[select].0 + 1
                    queue.append(select+4)
                }
            }
            if select + 5 <= 100 {
                if table[select].0 + 1 < table[select+5].0 {
                    table[select+5].0 = table[select].0 + 1
                    queue.append(select+5)
                }
            }
            if select + 6 <= 100 {
                if table[select].0 + 1 < table[select+6].0 {
                    table[select+6].0 = table[select].0 + 1
                    queue.append(select+6)
                }
            }
        }
    }
    print(table[100].0)
}

solution()
