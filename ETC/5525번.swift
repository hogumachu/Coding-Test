// 출처 : 백준 IOIOI
// https://www.acmicpc.net/problem/5525
// 풀이 : hogumachu
// 처음에 푼 것도 O(n)으로 접근을 했지만 이상하게 시간 초과가 나옴
// IOI를 반복하면서 연속으로 값이 IOI가 n번 맞게 되면 result를 1 증가시키는 방식으로 구현함

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let s = readLine()!.map{$0}

var result = 0
var compare = 0
var i = 0
while i < m-2 {
    if String(s[i...i+2]) == "IOI" {
        compare += 1
        if compare == n {
            compare -= 1
            result += 1
        }
        i += 1
    } else {
        compare = 0
    }
    i += 1
}

print(result)
