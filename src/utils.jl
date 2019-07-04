function same_size(arrs...)
    s1 = size(arrs[1])
    return all(x -> size(x) == s1, arrs)
end
