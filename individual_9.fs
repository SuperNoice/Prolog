let prost x =
    let mutable k=0
    let mutable i=1
    while (i<=x) do 
        if (x%i=0) then
            k<-k+1
        i<-i+1
    if (k=2) then true
    else false
    
let start() =
    let mutable max=0
    let mutable count=0
    let mutable n=0
    let mutable memA=0
    let mutable memB=0
    for a in -999 .. 999 do
        for b in -999 .. 999 do
            count<-0
            n<-0
            while prost (n*n+a*n+b) do
                count<-count+1
                n<-n+1
            if (count>max) then 
                max<-count
                memA<-a
                memB<-b
    memA*memB

let test() =
    let mutable count=0
    let mutable n=0
    while prost (n*n+n+41) do
        count<-count+1
        n<-n+1
    count
    

[<EntryPoint>]
let main argv =
    System.Console.WriteLine(start())
    System.Console.ReadKey()
    0
