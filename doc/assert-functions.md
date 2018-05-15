# Assert functions

We like to test our code during runtime by using assertions a.k.a. assert functions:

    assert_empty() { [ -z "$1" ]      || err $FUNCNAME "$@" ; }; export -f assert_empty
    assert_equal() { [ "$1" = "$2" ]  || err $FUNCNAME "$@" ; }; export -f assert_equal
    assert_match() { [[ "$2" =~ $1 ]] || err $FUNCNAME "$@" ; }; export -f assert_match

Examples:

    assert_empty ""
    assert_equal "foo" "foo"
    assert_match "f*" "foo"
