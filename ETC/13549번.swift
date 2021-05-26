// 출처 : 백준 숨바꼭질 3
// https://www.acmicpc.net/problem/13549
// 풀이 : hogumachu

import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0], k = input[1]
    var queue: [Int] = []
    var values: [Int] = Array(repeating: -1, count: k*2+1)
    var index = 0
    if n > k {
        values = Array(repeating: -1, count: n*2+1)
    }

    func findK(_ num: Int) -> Void {
        if num == k {
            return
        } else if num > k {
            if values[num-1] == -1 || values[num-1] > values[num] + 1 {
                values[num-1] = values[num] + 1
                queue.append(num-1)
            }
        } else {
            if values[num*2] == -1 || values[num*2] > values[num] {
                values[num*2] = values[num]
                queue.append(num*2)
            }


            if num-1 > 0, values[num-1] == -1 || values[num-1] > values[num] + 1{
                values[num-1] = values[num] + 1
                queue.append(num-1)
            }
            if values[num+1] == -1 || values[num+1] > values[num] + 1{
                values[num+1] = values[num] + 1
                queue.append(num+1)
            }

        }
    }
    values[n] = 0
    queue.append(n)

    while queue.count > index && values[k] == -1 {
        let select = queue[index]
        index += 1
        findK(select)
    }
    print(values[k])
}

solution()
