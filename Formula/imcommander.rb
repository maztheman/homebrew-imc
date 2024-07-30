require_relative "../lib/cmake"

class Imcommander < Formula
	desc "ImGui Total Commander split panel file manager"
	homepage "https://github.com/maztheman/ImCommander"
	url "https://github.com/maztheman/ImCommander/archive/refs/tags/v0.0.4.tar.gz"
	sha256 "561d82a83e20e7df87e3e51b5d83edc96ae0255b87968ad79a3210a02be52dd6"
	head "https://github.com/maztheman/ImCommander.git", branch: "main"
	version "0.0.4"

	depends_on "cmake" => :build
	depends_on "ninja" => :build

	def install
		system "cmake", *imc_cmake_args
		system "cmake", "--build", "build"
		system "cmake", "--install", "build"
		prefix.install "build/install_manifest.txt"
	end
	def caveats
		<<~EOS
		  You need to take some manual steps in order to make this formula work:
			"$(brew --repo maztheman/imc)/tools/do-caveats.sh"
		EOS
	end
end