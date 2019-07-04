struct Bodies{T<:AbstractVector}
    mass::T
    positions::Tuple{T, T, T}
    velocities::Tuple{T, T, T}
    accelerations::Tuple{T, T, T}

    function Bodies{T}(m, r, v, a) where {T}

        !same_size(m, r..., v..., a...) && throw(DimensionMismatch())
        return new(m, r, v, a)
    end

end


function Bodies(
    m::T,
    r::Tuple{T, T, T},
    v::Tuple{T, T, T},
    a::Tuple{T, T, T}
) where{T}

    return Bodies{T}(m, r, v, a)
end
