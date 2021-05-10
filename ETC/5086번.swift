// 출처 : 백준 배수와 약수
// https://www.acmicpc.net/problem/5086
// 풀이 : hogumachu
import Foundation

func solution() {
    while true {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        let first = input[0], second = input[1]
        if first == 0, second == 0 {
            break
        }
        if second % first == 0 {
            print("factor")
        } else if first % second == 0 {
            print("multiple")
        } else {
            print("neither")
        }
    }
}

solution()
