require 'formula'

class Dockutil < Formula
  homepage 'https://github.com/kcrawford/dockutil'
  head 'https://github.com/kcrawford/dockutil.git'

  depends_on :python

  resource 'plistlib' do
    url 'https://pypi.python.org/packages/source/p/plist/plist-0.2.tar.gz'
    sha1 'eac8a0d71a20515f955101429101b3b9f445f809'
  end

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('plistlib').stage { system "python", *install_args }

    bin.install 'scripts/dockutil'
  end

  test do
    assert_equal "1.1.4", `#{bin}/dockutil --version`.strip
  end
end