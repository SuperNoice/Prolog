let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    System.Console.Write("Введите кол-во элементов списка: ")
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    System.Console.Write("Ввод списка:\n")
    read_list n

let rec findEl L El = 
    match L with
    |head::tail when head=El -> true
    |head::tail -> findEl tail El
    |[] -> false
    
let FindCountEl L El = 
    let rec findCountEl L El count = 
        match L with
        |head::tail when head=El -> findCountEl tail El count+1
        |head::tail -> findCountEl tail El count
        |[] -> count
    findCountEl L El 0

let MakeUnicList list =  
    let rec makeUnicList list res =  
        match list with
        |head::tail when findEl res head = false -> let result = res@[head] 
                                                    makeUnicList list result
        |head::tail -> makeUnicList tail res
        |[]->res
    makeUnicList list []
    
let MakeCountList refList unicList = 
    let rec makeCountList refList unicList res = 
        match unicList with
        |head::tail -> let count = FindCountEl refList head
                       let result = res@[count]
                       makeCountList refList tail result
        |[]->res
    makeCountList refList unicList []

let SortList list = 
    let rec sort pred list res = 
        match list with
        |s1::s2::tail when s1<s2 -> let result = pred@[s2;s1]@tail
                                    sort [] result result
        |s1::s2::tail -> 
            let Tail = s2::tail
            let prednew = pred@[s1]
            sort prednew Tail res      
        |[_]->res
        |[]->res
    sort [] list list

let SortListPair list list2 = 
    let rec sort pred list res pred2 list2 res2 = 
        match list,list2 with
        |s1::s2::tail,s3::s4::tail2 when s1<s2 -> 
            let result = pred@[s2;s1]@tail
            let result2 = pred2@[s4;s3]@tail2
            sort [] result result [] result2 result2
        
        |s1::s2::tail,s3::s4::tail2 -> 
            let Tail = s2::tail
            let prednew = pred@[s1]
            let Tail2 = s4::tail2
            let prednew2 = pred2@[s3]
            sort prednew Tail res prednew2 Tail2 res2
        
        |[],[]->res,res2
        |_,[]->res,res2
        |[],_->res,res2
        |_,_->res,res2
    
    sort [] list list [] list2 list2

let rec PrintNum (count,num) = 
    match count,num with
    |h1::tail,h2::tail2 when h1>0 ->
        System.Console.Write(int(h2));
        System.Console.Write(' ');
        let newcount = 
            let head = h1-1
            head::tail
        PrintNum (newcount,num)

    |h1::tail,h2::tail2 -> PrintNum (tail,tail2)
    |_,_ -> ()

[<EntryPoint>]
let main argv = 
    
    let list = read_data
    let unicEl = MakeUnicList list
    let unicCountList = MakeCountList list unicEl
    let sortedKortej = SortListPair unicCountList unicEl
    PrintNum sortedKortej

    let z = System.Console.ReadKey()
    0 // return an integer exit code