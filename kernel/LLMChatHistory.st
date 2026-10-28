Object subclass: LLMChatHistory [
    | messages |
    LLMChatHistory class >> new [
        ^ super new init
    ]
    init [
        messages := OrderedCollection new.
        ^ self
    ]
    addUser: s [
        messages add: (LLMMessage role: 'user' content: s)
    ]
    addAssistant: s [
        messages add: (LLMMessage role: 'assistant' content: s)
    ]
    messages [ ^ messages ]
    prompt [
        ^ String streamContents: [:out |
            messages do: [:m | out nextPutAll: m asString; cr ] ]
    ]
]
