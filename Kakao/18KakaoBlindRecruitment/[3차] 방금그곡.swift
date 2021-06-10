// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [3차] 방금그곡
// https://programmers.co.kr/learn/courses/30/lessons/17683
// 풀이 : hogumachu

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var result = "(None)"
    var resultArray = [(Int, String)]()
    var newM = ""
    for c in m {
        if c == Character("#") {
            newM.removeLast()
        }
        newM += "\(c),"
    }
    for musicinfo in musicinfos {
        let music = musicinfo.split(separator: ",")
        let hm1 = music[0].split(separator: ":")
        let hm2 = music[1].split(separator: ":")
        var counting = (Int(hm2[0])! - Int(hm1[0])!) * 60 + (Int(hm2[1])! - Int(hm1[1])!)
        var compareStr = ""
        var stringCount = 0
        var breakPoint = false
        while counting >= stringCount && !breakPoint{
            for c in music[3] {
                if c == Character("#") {
                    compareStr.removeLast()
                    compareStr += "\(c),"
                } else {
                    if counting == stringCount {
                        breakPoint = true
                        break
                    }
                    compareStr += "\(c),"
                    stringCount += 1
                }
            }
        }

        if compareStr.contains(newM) {
            resultArray.append((counting, String(music[2])))
        }
    }
    resultArray.sort(by: {
            if $0.0 > $1.0 {
                return true
            } else {
                return false
            }
    })

    if resultArray.count == 0 {
        return result
    }

    return resultArray[0].1
}
