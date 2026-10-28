| failures |
failures := 0.

"LLMMessage"
| msg |
msg := LLMMessage role: 'user' content: 'hi'.
(msg role = 'user' and: [ msg content = 'hi' and: [ msg asString = 'user : hi' ] ]) ifFalse: [
    'FAIL LLMMessage' printNl.
    failures := failures + 1.
].

"LLMChatHistory"
| hist |
hist := LLMChatHistory new.
hist addUser: 'Hi'.
hist addAssistant: 'Hello'.
((hist messages size = 2) and: [ (hist messages at: 1) role = 'user' ]) ifFalse: [
    'FAIL LLMChatHistory' printNl.
    failures := failures + 1.
].

"LLMPromptBuilder"
| builder prompt |
builder := LLMPromptBuilder new system: 'sys'.
builder user: 'usr'.
prompt := builder build.
((prompt startsWith: 'sys') and: [ (prompt indexOfSubCollection: 'User: usr') > 0 ]) ifFalse: [
    'FAIL LLMPromptBuilder build' printNl.
    failures := failures + 1.
].

"LLMTokenizer"
| tokens |
tokens := LLMTokenizer tokenize: 'a b c'.
((tokens size = 3) and: [ (LLMTokenizer count: 'a b c') = 3 ]) ifFalse: [
    'FAIL LLMTokenizer' printNl.
    failures := failures + 1.
].

failures printNl.
failures = 0 ifTrue: [ 'LLM utilities tests passed' printNl ] ifFalse: [ 'LLM utilities tests failed' printNl ].
