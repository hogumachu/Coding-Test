// 출처 : 백준 스타트와 링크
// https://www.acmicpc.net/problem/14889
// 풀이 : hogumachu

let n = Int(readLine()!)!
var values: [[Int]] = Array(repeating: [], count: n)
var indices: [Int] = Array(0..<n)
var result = 100000
for i in 0..<n {
    values[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

for i in 0..<n/2 {
    visit([i], i+1)
}
print(result)

func visit(_ numbers: [Int], _ index: Int) -> Void {
    if result == 0 {
        return
    }
    if index >= n {
        return
    }
    if numbers.count == n / 2 {
        var value1 = 0
        var value2 = 0
        for i in 0..<numbers.count - 1 {
            for j in i+1..<numbers.count {
                value1 += values[numbers[i]][numbers[j]] + values[numbers[j]][numbers[i]]
            }
        }
        let k = indices.filter{!numbers.contains($0)}
        for i in 0..<k.count - 1 {
            for j in i+1..<k.count {
                value2 += values[k[i]][k[j]] + values[k[j]][k[i]]
            }
        }
        result = result > abs(value1 - value2) ? abs(value1 - value2) : result
    } else {
        for i in index..<n {
            if !numbers.contains(i) {
                visit(numbers + [i], i+1)
            }
        }
    }
}
