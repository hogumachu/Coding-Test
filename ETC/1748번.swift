// 출처 : 백준 수 이어 쓰기 1
// https://www.acmicpc.net/problem/1748
// 풀이 : hogumachu

let n = Int(readLine()!)!
var result = 0

var compare = 1

while (compare * 10) - 1 < n {
    result += "\(compare)".count * compare * 9
    compare *= 10
}

result += "\(compare)".count * (n - compare + 1)

print(result)
