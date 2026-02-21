using Pkg, PackageCompiler

# Path definition
env_alias = "@helix-lsp"

# 1. Update the packages from GitHub
Pkg.activate(env_alias)
Pkg.update()

# 2. Get the physical path for PackageCompiler
project_dir = dirname(Base.load_path_expand(env_alias))
so_path = joinpath(project_dir, "JuliaLSP.so")

# 3. Build the x86 binary
create_sysimage(
    ["LanguageServer", "SymbolServer", "JuliaFormatter"],
    sysimage_path=so_path,
    project=project_dir
)

println("Success! Sysimage built at $so_path")
