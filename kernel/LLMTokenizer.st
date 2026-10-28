Object subclass: LLMTokenizer [
    <category: 'LLM-Utilities'>
    LLMTokenizer class >> tokenize: aString [
        ^ aString substrings: ' '
    ]
    LLMTokenizer class >> count: aString [
        ^ (self tokenize: aString) size
    ]
    LLMTokenizer class >> detokenize: aTokens [
        ^ String streamContents: [:out | aTokens do: [:t | out nextPutAll: t; space ] ]
    ]
]
