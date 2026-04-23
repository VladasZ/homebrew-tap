class QemuSpice < Formula
  desc "QEMU with SPICE server enabled (for virt clipboard/resize on macOS)"
  homepage "https://www.qemu.org/"
  url "https://download.qemu.org/qemu-10.2.2.tar.xz"
  sha256 "784b296ff29c1417aa72323abcb2d2ea9ab9771724f577dcd785c3b04f21e176"
  license "GPL-2.0-only"

  bottle do
    root_url "https://github.com/VladasZ/homebrew-tap/releases/download/qemu-spice-10.2.2"
    sha256 arm64_sequoia: "586fd364d7982b577cf2aeeeec374bbc8c9f36a4590c2509b46d8b58db7026b9"
  end

  # Keg-only so `brew install qemu` can coexist. `virt` resolves the path
  # through `brew --prefix qemu-spice`; end users on the CLI prepend
  # `$(brew --prefix qemu-spice)/bin` to PATH if they want these binaries.
  keg_only "conflicts with mainline qemu"

  depends_on "libtool" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build
  depends_on "python@3.14" => :build
  depends_on "spice-protocol" => :build

  depends_on "capstone"
  depends_on "dtc"
  depends_on "glib"
  depends_on "gnutls"
  depends_on "jpeg-turbo"
  depends_on "libpng"
  depends_on "libslirp"
  depends_on "libssh"
  depends_on "libusb"
  depends_on "lzo"
  depends_on "ncurses"
  depends_on "pixman"
  depends_on "snappy"
  depends_on "spice-server"
  depends_on "vde"
  depends_on "zstd"

  uses_from_macos "bison" => :build
  uses_from_macos "flex" => :build
  uses_from_macos "bzip2"

  def install
    ENV["LIBTOOL"] = "glibtool"

    rm(Dir["python/wheels/*"] - Dir["python/wheels/pycotap-*-none-any.whl"])

    args = %W[
      --prefix=#{prefix}
      --cc=#{ENV.cc}
      --host-cc=#{ENV.cc}
      --disable-bsd-user
      --disable-download
      --disable-guest-agent
      --disable-sdl
      --disable-gtk
      --enable-capstone
      --enable-cocoa
      --enable-curses
      --enable-fdt=system
      --enable-libssh
      --enable-slirp
      --enable-spice
      --enable-vde
      --enable-virtfs
      --enable-zstd
      --extra-cflags=-DNCURSES_WIDECHAR=1
    ]

    args << "--smbd=#{HOMEBREW_PREFIX}/sbin/samba-dot-org-smbd"

    system "./configure", *args
    system "make", "V=1", "install"
  end

  test do
    assert_match version.to_s,
      shell_output("#{bin}/qemu-system-aarch64 --version")
    # Presence of SPICE in help output is what distinguishes this build.
    assert_match "spice",
      shell_output("#{bin}/qemu-system-aarch64 -spice help 2>&1")
  end
end
