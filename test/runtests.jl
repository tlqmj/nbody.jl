using nbody
using Test

@testset "nbody.jl" begin
end

@testset "utils.jl" begin
    @testset "same_size" begin
        @test  nbody.same_size([1,2,3], [2,3,4], [5,6,7])
        @test !nbody.same_size([1,2,3], [2,3,4], [5,6])
    end
end

@testset "bodies.jl" begin
    @test_throws DimensionMismatch Bodies(
        [1.0, 2.0],
        ([1.0, 2.0], [1.0, 2.0], [1.0, 2.0]),
        ([1.0, 2.0], [1.0, 2.0], [1.0, 2.0]),
        ([1.0, 2.0], [1.0, 2.0], [1.0]))
end
