import Foundation

class CoronaClass {
 
    var seats = [Int]()
    var seatsCount = 0

    init(n: Int) {
        self.seatsCount = n
    }
     
    func seat() -> Int {
        if seats.count == 0 {
            seats.append(0)
            return 0
        }
        
        if (seats.count == 1) && (seats.first == 0) {
            seats.append(seatsCount - 1)
            return seatsCount - 1
        }
        
        if seats.count > 1 {
            var maxDistance = seatsCount - 1 - seats[seats.count-1]
            var seatNumber = seatsCount-1
            var i = 0
            
            while i <= seats.count - 2 {
                let distance = (seats[i+1] - seats[i] ) / 2
                            
                if distance > maxDistance {
                    maxDistance = distance
                    seatNumber = seats[i] + distance
                }
                
                i += 1
                
            }
            
            seats.append(seatNumber)
            seats.sort()
            return seatNumber
        }
        
        seats.append(0)
        seats.sort()
        return 0
    }
     
    func leave(_ p: Int) {
        guard let index = seats.firstIndex(of: p) else { return }
        seats.remove(at: index)
    }
}
