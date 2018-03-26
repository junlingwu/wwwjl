
function golden_Search(f,l0,r0,e=0.01)
    n = ceil(log(e/abs(l0-r0))/log(0.618))
    if l0<r0
        l = l0
        r = r0
    else
        if l0>r0
            l = r0
            r = l0
        else
            println("ERROR!")
        end
    end
    
    for i=1:n
        l1=l+0.382(r-l)
        r1=l+0.618(r-l)
        fl1=f(l1)
        fr1=f(r1)
        if fl1<fr1
            r=r1
        else
            l=l1
        end
    end
    return l,r
end

golden_Search(x->x^4-14*x^3+60*x^2-70*x,0,2,0.3)


golden_Search(x->x^4-14*x^3+60*x^2-70*x,0,2,0.3)


function fibonacci(f,l0,r0,e=0.3)
    if l0<r0
        l = l0
        r = r0
    else
        if l0>r0
            l = r0
            r = l0
        else
            println("ERROR!")
        end
    end
    p=0
    threshold=abs(r0-l0)/e
    fib=[1,2]
    n=3
    current=fib[n-1]+fib[n-2]
    while current<threshold
        push!(fib,current)
        n+=1
        current=fib[n-1]+fib[n-2]
    end
    push!(fib,current)
   
    for i=1:(n-1)
        if i<(n-1)
          p=1-fib[n-i]/fib[n-i+1]
          l1=l+p*(r-l)
          r1=l+(1-p)*(r-l)
          fl1=f(l1)
          fr1=f(r1)
        else      
          p=1-fib[n-i]/fib[n-i+1]
          l1=l+(p-0.05)*(r-l)  ##最后一次迭代令e=0.05 
          r1=l+(1-p)*(r-l)
          fl1=f(l1)
          fr1=f(r1)            
        end
        if fl1<fr1
            r=r1
        else
            l=l1
        end
    end
    return l,r
end



fibonacci(x->x^4-14*x^3+60*x^2-70*x,0,2,0.3)
