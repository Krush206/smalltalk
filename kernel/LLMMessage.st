Object subclass: LLMMessage [
    | role content |
    LLMMessage class >> role: r content: c [
        ^ self new initRole: r content: c
    ]
    initRole: r content: c [
        role := r.
        content := c.
        ^ self
    ]
    role [ ^ role ]
    content [ ^ content ]
    asString [ ^ role , ' : ' , content ]
]
