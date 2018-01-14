//: Playground - noun: a place where people can play


let BuyHashLate:Double = 2.2
let MiningVolume:Double = 0.02
let MaintenanceFee:Double = 0.00000025

class Assets{
    let BuyHashLate:Double
    let MiningVolume:Double
    let MaintenanceFee:Double
    
    var Day:Int = 0
    var Assets:Double
    var HashLate:Int = 0
    var BuyHashHistory:[Int] = Array(repeating: 0,count: 365)
    
    init(BuyHashLate buyhashlate:Double,Assets assets:Double,MiningVolume miningvolume:Double,MaintenanceFee maintenancefee:Double){
        self.BuyHashLate = buyhashlate
        self.Assets = assets
        self.MiningVolume = miningvolume
        self.MaintenanceFee = maintenancefee
    }
    
    func nextDay(){
        self.Day += 1
        self.HashLate -= self.BuyHashHistory[self.Day%365]
        let buy = Int(self.Assets/self.BuyHashLate)
        self.HashLate +=  buy
        self.Assets -= Double(buy)*self.BuyHashLate
        self.Assets += MiningVolume*Double(HashLate)
        self.Assets -= Double(self.HashLate)*self.MaintenanceFee
        self.BuyHashHistory[self.Day%365] = buy
    }
    func printAssets(){
        print("\(self.Day)day")
        print("HashLate:\(self.HashLate)0GH/s")
        print("MaintenanceFee:\(self.MaintenanceFee*Double(self.HashLate))$")
        print("Assets:\(self.Assets)$")
    }
}

let assets:Assets = Assets(BuyHashLate: BuyHashLate,Assets: 35.2,MiningVolume: MiningVolume,MaintenanceFee: MaintenanceFee)
assets.printAssets()
for _ in 1...730{
    assets.nextDay()
    assets.printAssets()
}
