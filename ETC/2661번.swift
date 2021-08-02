// 출처 : 백준 좋은수열
// https://www.acmicpc.net/problem/2661
// 풀이 : hogumachu

let n = Int(readLine()!)!
var result = false

recursive([1], 1)

func recursive(_ num: [Int], _ count: Int) {
    if result {
        return
    }
    if count == n {
        print(num.reduce("", { String($0) + String($1) }))
        result = true
        return
    }
    let last = num.last!
    for i in 1...3 {
        if i != last {
            if canAdd(num + [i]) {
                recursive(num + [i], count + 1)
            }
        }
    }

}

func canAdd(_ arr: [Int]) -> Bool {
    for i in 1...arr.count / 2 {
        for j in 0..<n {
            if j + i * 2 > arr.count {
                break
            }
            if arr[j..<j + i] == arr[j + i..<j + i * 2] {
                return false
            }
        }
    }
    return true
}
