// 출처 : 백준 뒤집기
// https://www.acmicpc.net/problem/1439
// 풀이 : hogumachu
// 다음 패턴이 다르다면 count를 1 증가해서
// 몇개의 패턴을 가지고 있는지 분석
// 패턴의 개수의 절반이 뒤집기 최소 횟수임
// a(1) = 0
// ab(2) = 1
// aba(3) = 1
// abab(4) = 2
// ...
// abababab(8) = 4
// ababababa(9) = 4


import Foundation

func solution() -> Void {
    let input = readLine()!
    var before = "A"
    var count = 0

    for i in input {
        if before == String(i) {
            continue
        } else {
            count += 1
            before = String(i)
        }
    }
    print(count/2)
}

solution()
