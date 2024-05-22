require_relative "../lib/cmake"

class Imcommander < Formula
	desc "ImGui Total Commander split panel file manager"
	homepage "https://github.com/maztheman/ImCommander"
	url "https://github.com/maztheman/ImCommander/archive/refs/tags/v0.0.2.tar.gz"
	sha256 "97caddcd82cd1b83f3b3d1f9874d8704f0c3f323c5de0ebe81f314876c536404"
	head "https://github.com/maztheman/ImCommander.git", branch: "main"
	version "0.0.2"

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