cc_binary(
    name = 'app',
    srcs = 'main.cpp',
    deps = [
        '//foo:foo',
        '//bar:bar',
        '#pthread',
        '#boost_system'
    ],
    dynamic_link=False
)
