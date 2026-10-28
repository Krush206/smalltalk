| failures |
failures := 0.

"ShellUtility run"
| out |
out := ShellUtility run: 'echo hello'.
(out = 'hello
') ifFalse: [
    'FAIL ShellUtility run' printNl.
    failures := failures + 1.
].

"ShellUtility runLines"
out := ShellUtility runLines: 'printf "a\nb\nc"'.
((out size = 3) and: [ (out at: 1) = 'a' and: [ (out at: 2) = 'b' and: [ (out at: 3) = 'c' ] ] ]) ifFalse: [
    'FAIL ShellUtility runLines' printNl.
    failures := failures + 1.
].

"ShellUtility runStatus"
(ShellUtility runStatus: 'true') ifFalse: [
    'FAIL ShellUtility runStatus true' printNl.
    failures := failures + 1.
].
(ShellUtility runStatus: 'false') ifTrue: [
    'FAIL ShellUtility runStatus false' printNl.
    failures := failures + 1.
].

"ShellCommand"
| cmd |
cmd := ShellCommand new.
cmd command: 'echo'.
cmd addArgument: 'hi'.
(cmd asString = 'echo hi') ifFalse: [
    'FAIL ShellCommand asString' printNl.
    failures := failures + 1.
].
(ShellUtility run: cmd asString) = 'hi
' ifFalse: [
    'FAIL ShellCommand run' printNl.
    failures := failures + 1.
].

failures printNl.
failures = 0 ifTrue: [ 'Shell utilities tests passed' printNl ] ifFalse: [ 'Shell utilities tests failed' printNl ].
