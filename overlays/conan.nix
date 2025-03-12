self: super: {
  conan = super.conan.overrideAttrs (old: rec {
    version = "2.2.3";
    src = super.fetchFromGitHub {
      owner = "conan-io";
      repo = "conan";
      rev = "refs/tags/${version}";
      hash = "sha256-5JcxehIE6uoYTk8SOmSYm6IXQwAnWA8cPK0jSpWt6/I=";
    };
    disabledTestPaths = [
      # Requires cmake, meson, autotools, apt-get, etc.
      "conans/test/functional/command/new_test.py"
      "conans/test/functional/command/test_install_deploy.py"
      "conans/test/functional/graph/test_transitive_build_scripts.py"
      "conans/test/functional/layout/test_editable_cmake_components.py"
      "conans/test/functional/layout/test_editable_cmake.py"
      "conans/test/functional/layout/test_in_subfolder.py"
      "conans/test/functional/layout/test_source_folder.py"
      "conans/test/functional/toolchains/"
      "conans/test/functional/tools_versions_test.py"
      "conans/test/functional/tools/scm/test_git.py"
      "conans/test/functional/tools/system/package_manager_test.py"
      "conans/test/functional/util/test_cmd_args_to_string.py"
      "conans/test/integration/command_v2/list_test.py"
      "conans/test/unittests/tools/env/test_env_files.py"
      # Requires local repository
      "conans/test/performance/test_large_graph.py"
      "conans/test/integration/toolchains/gnu/test_autotoolsdeps.py"
      "conans/test/functional/test_local_recipes_index.py"
    ];
    meta = with super.lib; {
      description = "Decentralized and portable C/C++ package manager";
      homepage = "https://conan.io";
      changelog = "https://github.com/conan-io/conan/releases/tag/${version}";
      license = licenses.mit;
      maintainers = with maintainers; [ HaoZeke ];
    };
  });
}
