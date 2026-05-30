brew:
    # for now, don't dump sub-deps (e.g., uv, go, npm).
    brew bundle dump --describe --force --formula --cask
