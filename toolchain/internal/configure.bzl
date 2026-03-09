# Auto-set stdlib to "libc++" for target pairs that have cxx_lib configured
# but no explicit stdlib override. This prevents the builtin-libc++ ->
# stdc++ cross-compile fallback in cc_toolchain_config.bzl from kicking in,
# since the user has provided the actual libc++ libraries via cxx_lib.
merged_stdlib = dict(rctx.attr.stdlib)
for target_pair in rctx.attr.cxx_lib.keys():
    if target_pair not in merged_stdlib:
        merged_stdlib[target_pair] = "libc++"

# ... other content from the original file ...

stdlib_dict = merged_stdlib,