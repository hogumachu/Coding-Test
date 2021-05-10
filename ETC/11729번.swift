// 출처 : 백준  하노이 탑 이동 순서
// https://www.acmicpc.net/problem/11729
// 풀이 : hogumachu

import Foundation

func solution() {

    let n = Int(readLine()!)!
    print(pow(2,n)-1)
    func hanoi(DiskNum n:Int, from: Int, to: Int, by: Int){
        if n==1{
            print("\(from) \(to)")
        }
        else{
            hanoi(DiskNum: n-1, from: from, to: by, by: to)
            print("\(from) \(to)")
            hanoi(DiskNum: n-1, from: by, to: to, by: from)
        }
    }
    hanoi(DiskNum: n, from: 1, to: 3, by: 2)
}

solution()
