// 출처 : 백준 부등호
// https://www.acmicpc.net/problem/2529
// 풀이 : hogumachu

_ = readLine()

let orders = readLine()!.split { $0 == " " }.map { String($0) }
var result = (maxi: false, mini: false)
var maxiResult = ""
var miniResult = ""

func maximum(_ orderIndex: Int, _ before: Int, _ value: [Int]) {
    if result.maxi {
        return
    }

    if orderIndex == orders.count {
        result.maxi = true
        maxiResult = value.reduce("", {String($0) + String($1)})
        return
    }

    if orders[orderIndex] == ">" {
        if before - 1 < 0 {
            return
        }
        for i in (0...before - 1).reversed() {
            if !value.contains(i) {
                maximum(orderIndex + 1, i, value + [i])
            }
        }
    } else {
        if before + 1 > 9 {
            return
        }
        for i in (before + 1...9).reversed() {
            if !value.contains(i) {
                maximum(orderIndex + 1, i, value + [i])
            }
        }
    }
}

func minimum(_ orderIndex: Int, _ before: Int, _ value: [Int]) {
    if result.mini {
        return
    }

    if orderIndex == orders.count {
        result.mini = true
        miniResult = value.reduce("", {String($0) + String($1)})
        return
    }

    if orders[orderIndex] == ">" {
        if before - 1 < 0 {
            return
        }
        for i in 0...before - 1 {
            if !value.contains(i) {
                minimum(orderIndex + 1, i, value + [i])
            }
        }
    } else {
        if before + 1 > 9 {
            return
        }
        for i in before + 1...9 {
            if !value.contains(i) {
                minimum(orderIndex + 1, i, value + [i])
            }
        }
    }
}

for i in 0...9 {
    minimum(0, i, [i])
}

for i in (0...9).reversed() {
    maximum(0, i, [i])
}

print(maxiResult)
print(miniResult)
