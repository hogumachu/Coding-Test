// 출처 : 백준 시험 감독
// https://www.acmicpc.net/problem/13458
// 풀이 : hogumachu

let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map{Int(String($0))!}
let bc = readLine()!.split(separator: " ").map{Int(String($0))!}
var result = 0
for i in 0..<n {
    a[i] -= bc[0]
    result += 1
    if a[i] > 0 {
        if a[i] % bc[1] == 0 {
            result += a[i] / bc[1]
        } else {
            result += a[i] / bc[1]
            result += 1
        }
    }
}
print(result)
