??? question "...if Barni uses AI responsibly"

    **Short answer:** yes. AI is a tool with failure modes, so I measure it, review what it produces, and keep it away from anything it should not see.

    - **Humans make the final call:** every AI suggestion is reviewed, tested and committed by hand. Nothing goes into a repository unread.
    - **Secrets never reach AI tools:** no key, password or token was ever shared with an AI assistant.
    - **Some work stays human by choice:** the whole interface was designed in Figma by hand, without AI tools.
    - **Measured, not trusted blindly:** the English version of this site will come from an AI translation pipeline on AWS Bedrock. Two models translate the same text so their results can be compared, evaluations score the output, and every proposal is reviewed, with accepted and declined changes tracked.

    !!! note "Work in progress"

        The translation pipeline is being built right now. This answer will be updated as it grows.

    **Why it matters:** AI can ship confident mistakes. Measuring it and keeping a human in the loop is what makes it safe to use in real work, while keeping out sensitive data is crucial.
