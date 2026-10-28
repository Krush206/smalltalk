Object subclass: LLMPromptBuilder [
    | system user hist |
    LLMPromptBuilder class >> new [
        ^ super new init
    ]
    init [
        system := ''.
        user := ''.
        hist := LLMChatHistory new.
        ^ self
    ]
    system: s [ system := s. ^ self ]
    user: s [ user := s. ^ self ]
    addHistory: h [ hist := h. ^ self ]
    build [
        ^ system , String cr , hist prompt , 'User: ' , user
    ]
]
