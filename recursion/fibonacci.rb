def fibs (number)
    first = 0
    second = 1
    count = 0
    if number <= 0 
        return first
    elsif number == 1 
        return second
    else
        (number-1).times do 
            count = first + second
            first = second 
            second = count
        end
    end
    return count
end

def fibs_rec (number)
    if number == 0
        return 0
    elsif number == 1 
        return 1
    else
        fibs_rec(number - 1) + fibs_rec(number - 2)
    end
end

puts fibs_rec(12)

puts fibs_rec(1)

puts fibs(12)

puts fibs(1)