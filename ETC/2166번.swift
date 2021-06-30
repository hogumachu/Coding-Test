// 출처 : 백준 다각형의 면적
// https://www.acmicpc.net/problem/2166
// 풀이 : hogumachu

let n = Int(readLine()!)!
var xy: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)

(0..<n).forEach({ index in
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    xy[index][0] = input[0]
    xy[index][1] = input[1]
})
var result = Double(0)
for i in 1..<n-1 {
    result += getArea(xy[0][0], xy[0][1], xy[i][0], xy[i][1], xy[i+1][0], xy[i+1][1])
}
print(abs(result))

func getArea(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int, _ x3: Int, _ y3: Int) -> Double {
    return Double((x2 - x1) * (y3 - y1) - (x3 - x1) * (y2 - y1)) / 2
}
