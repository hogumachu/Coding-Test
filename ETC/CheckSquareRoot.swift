// 출처 : 프로그래머스 연습문제 정수 제곱근 판별
// https://programmers.co.kr/learn/courses/30/lessons/12934
// 풀이 : hogumachu

func solution(_ n:Int64) -> Int64{
    var mult: Int64 = 1
    var result: Int64 = 0

    while mult*mult < n {
        mult *= 10
    }
    mult /= 10
    while mult*mult < n {
        mult += 1
    }
    if mult*mult == n {
        result = (mult+1) * (mult+1)
    } else {
        result = -1
    }

    return result
}
