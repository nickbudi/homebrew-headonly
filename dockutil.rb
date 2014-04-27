require 'formula'

class Dockutil < Formula
  homepage 'https://github.com/kcrawford/dockutil'
  url 'https://github.com/kcrawford/dockutil/archive/4bbdbc95519b70ac00391c4ebe34592fd351f491.tar.gz'
  sha1 'd74268ba749c4484bc33510193f62ef7b4d4b2da'
  version '1.1.4'

  depends_on :python

  resource 'plistlib' do
    url 'https://pypi.python.org/packages/source/p/plist/plist-0.2.tar.gz'
    sha1 'eac8a0d71a20515f955101429101b3b9f445f809'
  end

  def install
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    python do
      resource('plistlib').stage { system python, *install_args }
    end

    bin.install 'scripts/dockutil'
  end

  test do
    assert_equal "1.1.4", `#{bin}/dockutil --version`.strip
  end
end