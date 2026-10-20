class Oxvelte < Formula
  desc "ESLint-compatible Svelte linter written in Rust. Same rules/diags, 4-25x faster"
  homepage "https://github.com/btbutts/oxvelte-tap"
  url "https://github.com/btbutts/oxvelte-tap/releases/download/v0.2.0/oxvelte-0.2.0.tar.gz"
  sha256 "58d079bdb22dbc700b2a4e88bf1dd17d94e5e51136e197c55fb76abb2407395f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    # Remove unrecognized options if they cause configure to fail
    # https://docs.brew.sh/rubydoc/Formula.html#std_configure_args-instance_method
    system "cargo", "install", *std_cargo_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test oxvelte`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    assert_match "oxvelte", shell_output("#{bin}/oxvelte --help")
  end
end
