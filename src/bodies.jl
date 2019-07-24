struct Bodies{T<:AbstractVector}
    masses::T
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

function Base.iterate(b::Bodies, i=1)
    if state > length(m)
        return nothing
    else
        mass = b.masses[i]
        position     = SVector(b.positions[1][i],     b.positions[2][i],     b.positions[3][i])
        velocity     = SVector(b.velocities[1][i],    b.velocities[2][i],    b.velocities[3][i])
        acceleration = SVector(b.accelerations[1][i], b.accelerations[2][i], b.accelerations[3][i])

        return (
            (mass = mass, position = position, velocity = velocity, acceleration = acceleration),
            i+1
        )
    end
end
