// 출처 : 백준 다이나믹 프로그래밍 2xn 타일링
// https://www.acmicpc.net/problem/11726
// 풀이 : hogumachu


import Foundation

let input = Int(readLine()!)!
var dynamicProgramming = [Int](repeating: 0, count: 1010)

dynamicProgramming[1] = 1
dynamicProgramming[2] = 2

if input <= 2 {
    print(dynamicProgramming[input])
} else {
    for i in 3...input {
        dynamicProgramming[i] = (dynamicProgramming[i-1] + dynamicProgramming[i-2]) % 10007
    }
    print(dynamicProgramming[input])
}
