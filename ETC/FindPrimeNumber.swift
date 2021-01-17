// 출처 : 프로그래머스 연습문제 소수 찾기
// https://programmers.co.kr/learn/courses/30/lessons/12921
// 풀이 : hogumachu

func solution(_ n:Int) -> Int {
    var result: Int = 2
    if n == 2 {
        return 1
    } else if n == 3{
        return result
    } else {
        for i in 4...n {
            var j: Int = 2
            while j*j <= i {
                if i % j == 0 {
                    result -= 1
                    break
                }
                j += 1
            }
            result += 1
        }
    }
    return result
}
