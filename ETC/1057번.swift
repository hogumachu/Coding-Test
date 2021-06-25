// 출처 : 백준 토너먼트
// https://www.acmicpc.net/problem/1057
// 풀이 : hogumachu

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0
var counting = input[0]
let a = input[1] - 1, b = input[2] - 1
var breakPoint = false
var values: [Bool] = Array(repeating: false, count: input[0])
values[a] = true
values[b] = true

while counting > 1 && !breakPoint {
    var select = 0
    result += 1
    for i in stride(from: 0, through: counting-1, by: 2) {
        if i + 1 <= counting - 1 {
            if values[i] && values[i+1] {
                breakPoint = true
                break
            }
            if values[i] {
                values[select] = true
                if select != i {
                    values[i] = false
                }
            }
            if values[i+1] {
                values[select] = true
                if select != i+1 {
                    values[i+1] = false
                }
            }

        } else {
            values[select] = values[i]
            values[i] = false
        }
        select += 1
    }

    if counting % 2 == 0 {
        counting /= 2
    } else {
        counting /= 2
        counting += 1
    }

}

print(result)
