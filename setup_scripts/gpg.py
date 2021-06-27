import sys
import os

command = sys.argv[1]
if command == 'generate':
    os.system('gpg --full-generate-key')

if command == 'list':
    # Copy bit after sec rsa4096
    os.system('gpg --list-secret-keys --keyid-format=long')

if command == 'export':
    # Copy this and add to GitHub settings page
    os.system('gpg --armor --export 3AA5C34371567BD2')

if command == 'gh_local':
    os.system('git config --global user.signingkey 3AA5C34371567BD2')
