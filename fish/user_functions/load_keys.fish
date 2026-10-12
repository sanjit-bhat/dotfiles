function load_keys
    # load id_ed25519 into ssh_agent using passphrase stored in macOS keychain.
    ssh-add --apple-load-keychain
end
