class Virglrenderer < Formula
  desc "VirGL 3D renderer library (UTM fork with Apple CGL workarounds)"
  homepage "https://github.com/utmapp/virglrenderer"
  url "https://github.com/utmapp/virglrenderer.git",
      revision: "852acf98e435ba40de4cd8b6881c33630a2244fb"
  version "1.1.0-utm"
  license "MIT"

  depends_on "libepoxy"
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkgconf" => :build

  def install
    # Skip tests, GL error checks (noise on macOS CGL), and venus (requires
    # Vulkan + MoltenVK which we don't depend on here). UTM enables venus
    # in their build; we stay minimal.
    system "meson", "setup", "build",
           "-Dtests=false",
           "-Dcheck-gl-errors=false",
           "-Dvenus=false",
           "-Drender-server-worker=thread",
           *std_meson_args
    system "meson", "compile", "-C", "build"
    system "meson", "install", "-C", "build"
  end

  test do
    (testpath/"t.c").write <<~C
      #include <virglrenderer.h>
      int main(void) { return 0; }
    C
    system ENV.cc, "-I#{include}/virgl", "t.c", "-L#{lib}",
           "-lvirglrenderer", "-o", "t"
    system "./t"
  end
end
