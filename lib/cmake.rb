require "formula"

def imc_cmake_args
	std_cmake_args + %W[
		-G Ninja
		-B build
		-S .
	]
end
