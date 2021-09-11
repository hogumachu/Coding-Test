// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [1차] 추석 트래픽
// https://programmers.co.kr/learn/courses/30/lessons/17676
// 풀이 : hogumachu
// 테케 3개 틀림
// 나중에 다시 풀기

func solution(_ lines: [String]) -> Int {
    var times: [(Double, Double)] = []
    var result = 1

    for line in lines {
        let sLine = line.split { $0 == " " }
        let time = convertTime(String(sLine[1]))
        let sec = Double(String(sLine[2].dropLast()))!
        times.append((time - sec , sec))
    }

    times.sorted { $0.0 < $1.0 }

    for i in 0..<times.count - 1 {
        var counting = 1
        for j in i + 1..<times.count {
            if times[j].0 < times[i].0 + times[i].1 + Double(1) {
                counting += 1
            } else {
                break
            }
        }

        result = max(result, counting)
    }

    print(times)

    return result
}

func convertTime(_ str: String) -> Double {
    let arr = str.split { $0 == "." }
    let t = arr[0].split { $0 == ":" }
    let h = Int(t[0])! * 3600
    let m = Int(t[1])! * 60
    let num = h + m + Int(t[2])!

    if arr.count == 1 {
        return Double(num)
    } else {
        return Double("\(num).\(arr[1])")!
    }
}
