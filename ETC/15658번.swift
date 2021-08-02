// 출처 : 백준 연산자 끼워 넣기 (2)
// https://www.acmicpc.net/problem/15658
// 풀이 : hogumachu
// func 안에 for문이 아닌 if문 을 넣으니까 시간 초과가 해결 되었음

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
let order = readLine()!.split(separator: " ").map { Int(String($0))! }

var maxResult = -Int.max
var minResult = Int.max

visit(order[0], order[1], order[2], order[3], 1, numbers[0])

print(maxResult)
print(minResult)

func visit(_ plus: Int, _ minus: Int, _ mult: Int, _ div: Int, _ next: Int, _ sum: Int) {
    if next == n {
        maxResult = max(maxResult, sum)
        minResult = min(minResult, sum)
        return
    }

    if plus != 0 {
        visit(plus - 1, minus, mult, div, next + 1, sum + numbers[next])
    }

    if minus != 0 {
        visit(plus, minus - 1, mult, div, next + 1, sum - numbers[next])
    }

    if mult != 0 {
        visit(plus, minus, mult - 1, div, next + 1, sum * numbers[next])
    }

    if div != 0 {
        visit(plus, minus, mult, div - 1, next + 1, sum / numbers[next])
    }

}
