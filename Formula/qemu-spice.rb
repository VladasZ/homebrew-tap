class QemuSpice < Formula
  desc "QEMU (UTM fork) with SPICE + virgl enabled, for virt clipboard/resize/3D"
  homepage "https://github.com/utmapp/qemu"
  url "https://github.com/utmapp/qemu/releases/download/v10.0.2-utm/qemu-10.0.2-utm.tar.xz"
  version "10.0.2-utm"
  sha256 "f1d7357547a71ae3339a115d5c8f2b72e3b0089531d67c2aca43326d320ac6ca"
  license "GPL-2.0-only"

  # Bump this when changing build flags without bumping the upstream version.
  revision 1

  bottle do
    root_url "https://github.com/VladasZ/homebrew-tap/releases/download/qemu-spice-10.0.2-utm"
    # (new bottle will need to be produced for the rebuild; users can build
    # from source in the meantime: brew install -s VladasZ/tap/qemu-spice)
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
  depends_on "libepoxy"
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
  depends_on "virglrenderer"
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
      --enable-opengl
      --enable-slirp
      --enable-spice
      --enable-vde
      --enable-virglrenderer
      --enable-virtfs
      --enable-zstd
      --extra-cflags=-DNCURSES_WIDECHAR=1
    ]

    args << "--smbd=#{HOMEBREW_PREFIX}/sbin/samba-dot-org-smbd"

    system "./configure", *args
    system "make", "V=1", "install"
  end

  test do
    assert_match "QEMU emulator",
      shell_output("#{bin}/qemu-system-aarch64 --version")
    # Presence of SPICE in help output is what distinguishes this build.
    assert_match "spice",
      shell_output("#{bin}/qemu-system-aarch64 -spice help 2>&1")
    # virtio-ramfb is the UTM-equivalent display device we built this for.
    assert_match "virtio-ramfb",
      shell_output("#{bin}/qemu-system-aarch64 -device help 2>&1")
  end
end
