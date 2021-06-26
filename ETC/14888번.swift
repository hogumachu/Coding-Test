// 출처 : 백준 연산자 끼워넣기
// https://www.acmicpc.net/problem/14888
// 풀이 : hogumachu

let n = Int(readLine()!)!
let values = readLine()!.split(separator: " ").map{Int(String($0))!}
var v = readLine()!.split(separator: " ").map{Int(String($0))!}
var order: [Int] = []
var maxi = -1_000_000_000
var mini = 1_000_000_000
for i in 0..<v.count {
    for _ in 0..<v[i] {
        order.append(i)
    }
}
for i in 0..<order.count {
    visit([i])
}
print(maxi)
print(mini)

func visit(_ indices: [Int]) -> Void {
    if indices.count == order.count {
        var returnValue = values[0]
        for i in 0..<indices.count {
            returnValue = calculate(returnValue, values[i+1], order[indices[i]])
        }
        maxi = maxi < returnValue ? returnValue : maxi
        mini = mini > returnValue ? returnValue : mini
        return
    } else {
        for i in 0..<order.count {
            if !indices.contains(i) {
                visit(indices + [i])
            }
        }
    }

}

func calculate(_ a: Int, _ b: Int, _ ord: Int) -> Int {
    switch ord {
    case 0:
        return a + b
    case 1:
        return a - b
    case 2:
        return a * b
    default:
        return a / b
    }
}
