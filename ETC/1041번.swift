// 출처 : 백준 주사위
// https://www.acmicpc.net/problem/1041
// 풀이 : hogumachu
// 주사위 1면의 최소 값 minOne
// 주사위 2면의 합 중에 최소 값 minTwo
// 주사위 3면의 합 중에 최소 값 minThree
// 이렇게 3가지의 값을 구하고
// 거기에 해당하는 식을 구하여 계산함
// n = 1일 때는 가장 큰 값이 바닥으로 향하게 하므로
// 숫자의 총합에서 가장 큰 값을 빼주었음

import Foundation

func solution() -> Void {
    let n = Int(readLine()!)!
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = input[0], b = input[1], c = input[2], d = input[3], e = input[4], f = input[5]
    let minOne = input.min()!
    let minTwo = min((a+b), (a+c), (a+d), (a+e), (b+c), (b+d), (b+f), (c+e), (c+f), (d+e), (d+f), (e+f))
    let minThree = min((a+b+c), (a+b+d), (a+c+e), (a+d+e), (b+c+f), (b+d+f), (c+e+f), (d+e+f))
    var result = 0
    if n == 1 {
        result = input.reduce(0, +) - input.max()!
    } else {
        result = 5 * minOne * (n-2) * (n-2) + 4 * minOne * (n-2) + 4 * minTwo * (n-1) + 4 * minTwo * (n-2) + 4 * minThree
    }
    print(result)
}

solution()
