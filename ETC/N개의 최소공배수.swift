// 출처 : 프로그래머스 연습문제 N개의 최소공배수
// https://programmers.co.kr/learn/courses/30/lessons/12953
// 풀이 : hogumachu

func solution(_ arr:[Int]) -> Int {
    var lcm = 0
    func getLCM(_ a:Int, _ b:Int) -> Int {
        var lcm = 1
        var divA = a
        var divB = b
        var dived = 2
        while divA != 1 || divB != 1 {
            if dived > divA || dived > divB {
                break
            }
            if divA % dived == 0 && divB % dived == 0{
                divA /= dived
                divB /= dived
                lcm *= dived
            } else {
                dived += 1
            }
        }

        return lcm*divA*divB
    }

    if arr.count == 1 {
        lcm = arr[0]
    } else {
        lcm = arr[0]
        for i in 1..<arr.count {
            lcm = getLCM(lcm, arr[i])
        }
    }
    return lcm
}
