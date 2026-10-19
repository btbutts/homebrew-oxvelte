class Oxvelte < Formula
  desc "Svelte linter/parser written in Rust"
  homepage "https://github.com/btbutts/oxvelte-tap"
  url "https://github.com/btbutts/oxvelte-tap/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "ff04df036e1fdbbc520b3b7119d676b552277defd166842965c0e16594e0743c"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "oxvelte", shell_output("#{bin}/oxvelte --help")
  end
end
