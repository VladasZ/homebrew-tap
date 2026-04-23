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
  depends_on "python@3.14" => :build

  def install
    # virglrenderer vendors mesa's src/gallium/ which needs PyYAML at
    # build time. PyYAML isn't a brew formula; install it into a build-
    # local venv and prepend to PATH so meson's python probe picks it up.
    venv = buildpath/"venv"
    system "python3.14", "-m", "venv", venv
    system venv/"bin/pip", "install", "--upgrade", "pip"
    system venv/"bin/pip", "install", "pyyaml"
    ENV.prepend_path "PATH", venv/"bin"

    # Skip tests, GL error checks (noise on macOS CGL), and venus (needs
    # Vulkan + MoltenVK -- skipped here). UTM enables venus in their own
    # build; we stay minimal.
    #
    # render-server-worker=process avoids pulling server_sources into the
    # main lib target; with worker=thread virglrenderer's meson.build
    # compiles server/render_worker.c which #errors without the
    # ENABLE_RENDER_SERVER_WORKER_THREAD define (only set when venus=true).
    system "meson", "setup", "build",
           "-Dtests=false",
           "-Dcheck-gl-errors=false",
           "-Dvenus=false",
           "-Drender-server-worker=process",
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
